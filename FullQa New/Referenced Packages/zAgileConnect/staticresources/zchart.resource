
function renderJqplotChart( chart_id , chart_type , data , jqplot_advanced_text , chartObj ){
	var CHART_DATA_EMPTY = "[[]]";
	var chart_time_series = "false";
	var chart_view_image = "false";
	var get_data_other_chart = false;
	var chart_datasource = [];
	var chart_legend_labels = chartObj.legendLabels;
	var dataContainsStringValues = false;
	
	if( onlyStringValuesInData(data , true ) )
		dataContainsStringValues = true;
	
	//Auxiliar Variable Values
	var number_distinct_x_values = getDistinct( data , true );
	var number_distinct_y_values = getDistinct( data , false );
	var min_x_value = getMin( data , true , false );
	var max_x_value = getMax( data , true , false );
	var min_y_value = getMin( data , false , false );
	var max_y_value = getMax( data , false , false );
	var min_x_value_date = getMin( data , true , true );
	var max_x_value_date = getMax( data , true , true );
	var min_y_value_date = getMin( data , false , true );
	var max_y_value_date = getMax( data , false , true );
	
	jqplot_advanced_text = jqplot_advanced_text.ReplaceAll("$.jqplot" , "jQuery.jqplot");
	try
	{
		//Get jqplot-options entered by the user in advanced options
		eval("var jqplot_options = " + jqplot_advanced_text );
	}catch(e){
		return "<div class='aui-message error'>Error in advanced options: " + e +" </div>";
	}
	
	//Default Values
	if( chartObj.defaultValues == true ){
		if( chart_type == "bar" || chart_type == "area" ){
			if( !jqplot_options.axes )
				jqplot_options.axes = {};
			if( !jqplot_options.axes.yaxis )
				jqplot_options.axes.yaxis = {};
			jqplot_options.axes.yaxis.min = 0;	
		}
	}
	
	var chart_bar_direction = "vertical";
	if( jqplot_options.seriesDefaults && jqplot_options.seriesDefaults.rendererOptions && jqplot_options.seriesDefaults.rendererOptions.barDirection )
		chart_bar_direction = jqplot_options.seriesDefaults.rendererOptions.barDirection;
	
	var BEZIER_CURVE_MIN_FOUR = "It is possible to render a bezier chart with more than three rows";
	var BEZIER_CURVE_LEN_EVEN = "It is possible to render a bezier chart with a number of even rows";
	var TIMESERIES_CHART_ONLY_DATE_VALUE = "It is possible to render a time-series chart with Date format for x-axis.";
	var BUBBLE_CHART_ONLY_THREE_COLUMNS = "It is possible to render a bubble chart with only three or four columns.";
	
	var current_data_string = JSON.stringify( data );
	if( current_data_string != CHART_DATA_EMPTY ){
		var empty_data = true;
		//Verify if no data available
		for( var i = 0 ; i < data.length ; ++i ){
			if( data[ i ].length > 1 ){
				empty_data = false;
				break;
			}
			for( var j = 0 ; j < data[ i ].length ; ++j ){
				var x_value = '' , y_value='';
				if( data[ i ][ j ].length > 0 )
					x_value = data[ i ][ j ][ 0 ].toString().trim();
				if( data[ i ][ j ].length > 1 )
					y_value = data[ i ][ j ][ 1 ].toString().trim();

				if( ( x_value.length != 0 && x_value != "0" ) || (y_value.length != 0 && y_value != "0" )  ){
					empty_data = false;
					i = data.length;
					break;
				}
			}
		}
		if( empty_data ){
			current_data_string = CHART_DATA_EMPTY;
			data = jQuery.parseJSON( CHART_DATA_EMPTY );
		}
	}
	
	//No data available
	if( current_data_string == CHART_DATA_EMPTY){
		chart_type = "bar";
		chart_time_series = "false";
		x_axis_date = "false";
		if( !jqplot_options.axes ){
			jqplot_options.axes = {};
			jqplot_options.axes.xaxis = {};
			jqplot_options.axes.yaxis = {};
		}
		else{
			if( !jqplot_options.axes.xaxis ){
				jqplot_options.axes.xaxis = {};
			}
			if( !jqplot_options.axes.yaxis ){		
				jqplot_options.axes.yaxis = {};
			}
		}
		jqplot_options.axes.yaxis.tickInterval = 1;
		jqplot_options.axes.yaxis.min = 0;
		jqplot_options.axes.yaxis.max = 5;
		jqplot_options.axes.xaxis.min = null;
		jqplot_options.axes.xaxis.max = null;
		jqplot_options.axes.xaxis.showTicks = false;
		
		if(!jqplot_options.cursor)
			jqplot_options.cursor = {};
		jqplot_options.cursor.showTooltip = false;
		jqplot_options.cursor.zoom = false;
		if( !jqplot_options.grid )
			jqplot_options.grid = {};
		jqplot_options.grid.drawGridlines = true;
		jqplot_options.grid.background = "#fffdf6";
		data = [[["" , "0"]]];
		current_data_string = CHART_DATA_EMPTY;
		//chart_bar_direction = "vertical";
	}


	//If chart is a bubble then the data has different form
	if( chart_type == "bubble" ){
		data = convertDataToBubble( data );
	}
	
	//Add new features according parameters.
	if( chart_type == "bar" ){
		if( !jqplot_options.axesDefaults ){
			jqplot_options.axesDefaults = {}
			jqplot_options.axesDefaults.autoscale = true;
		}
		else{
			if( jqplot_options.axesDefaults.autoscale === undefined ) jqplot_options.axesDefaults.autoscale = true;
		}
	}
	
	
	//Title properties
	if( !jqplot_options.title ){
		jqplot_options.title = {};
		jqplot_options.title.text = chartObj.title;
		jqplot_options.title.color = "rgb(0, 0, 0)";
	}else{
		if( jqplot_options.title.text === undefined ) jqplot_options.title.text = chartObj.title;
	}

	//Series Defaults properties
	if( !jqplot_options.seriesDefaults ){
		jqplot_options.seriesDefaults = {};
		jqplot_options.seriesDefaults.rendererOptions = {};
		if( chart_type == "bar" ){
			jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BarRenderer;
			jqplot_options.seriesDefaults.rendererOptions.fillToZero = true;
			if( chart_time_series == "true" ) jqplot_options.seriesDefaults.rendererOptions.barWidth = 3.5;
		}else if( chart_type == "pie" ){
			jqplot_options.seriesDefaults.renderer = jQuery.jqplot.PieRenderer;
			jqplot_options.seriesDefaults.rendererOptions.showDataLabels = true;
		}else if( chart_type == "area" ){
			jqplot_options.seriesDefaults.fill= true;
			jqplot_options.seriesDefaults.fillToZero = true;
		}
		else if( chart_type == "line" ){
			jqplot_options.seriesDefaults.showMarker = false;
		}
		else if( chart_type == "donut" ){
			jqplot_options.seriesDefaults.renderer = jQuery.jqplot.DonutRenderer;
			jqplot_options.seriesDefaults.rendererOptions.showDataLabels = true;
			jqplot_options.seriesDefaults.rendererOptions.sliceMargin =  3;
		}
		else if( chart_type == "bubble" ){
			jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BubbleRenderer;
		}
		else if( chart_type == "bezierCurve" ){
			jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BezierCurveRenderer;
		}
		
		if( chart_type != "pie" && chart_type != "donut" ){
			jqplot_options.seriesDefaults.trendline = {};
		}
	}
	else{
		if( !jqplot_options.seriesDefaults.renderer ){
			if( chart_type == "bar" ) jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BarRenderer;
			else if( chart_type == "pie" ) jqplot_options.seriesDefaults.renderer = jQuery.jqplot.PieRenderer;
			else if( chart_type == "area" ) jqplot_options.seriesDefaults.fill= true;
			else if( chart_type == "donut" ) jqplot_options.seriesDefaults.renderer = jQuery.jqplot.DonutRenderer;
			else if( chart_type == "bubble" ) jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BubbleRenderer;
			else if( chart_type == "bezierCurve" ) jqplot_options.seriesDefaults.renderer = jQuery.jqplot.BezierCurveRenderer;
		}
		if( chart_type == "pie" || chart_type == "donut" ){
			if( !jqplot_options.seriesDefaults.rendererOptions ){
				jqplot_options.seriesDefaults.rendererOptions = {};
				jqplot_options.seriesDefaults.rendererOptions.showDataLabels = true;
				if( chart_type == "donut" ) jqplot_options.seriesDefaults.rendererOptions.sliceMargin = 3;
			}
			else{
				if( jqplot_options.seriesDefaults.rendererOptions.showDataLabels === undefined )
					jqplot_options.seriesDefaults.rendererOptions.showDataLabels = true;
				if( chart_type == "donut" && jqplot_options.seriesDefaults.rendererOptions.sliceMargin === undefined )
					jqplot_options.seriesDefaults.rendererOptions.sliceMargin = 3;
			}
		}
		else if( chart_type == "bar" ){
			if( !jqplot_options.seriesDefaults.rendererOptions ){
				jqplot_options.seriesDefaults.rendererOptions = {};
				jqplot_options.seriesDefaults.rendererOptions.fillToZero = true;
			}
			else{
				if( jqplot_options.seriesDefaults.rendererOptions.fillToZero === undefined )	
					jqplot_options.seriesDefaults.rendererOptions.fillToZero = true;
			}
		}
		
		else if( chart_type == "area" ){
			if( !jqplot_options.seriesDefaults.rendererOptions ){
				jqplot_options.seriesDefaults.rendererOptions = {};
				jqplot_options.seriesDefaults.rendererOptions.fillToZero = true;
			}
			else if( jqplot_options.seriesDefaults.rendererOptions.fillToZero === undefined )	
				jqplot_options.seriesDefaults.rendererOptions.fillToZero = true;
		}
		else if( chart_type == "line" ){
			if( jqplot_options.seriesDefaults.showMarker === undefined )
				jqplot_options.seriesDefaults.showMarker = false;
		}
		else if( chart_type == "bubble" ){
		}
	}

	
	if( jqplot_options.legend ){
		//if( jqplot_options.legend.show === undefined ) jqplot_options.legend.show = true;
		if( jqplot_options.legend.labels === undefined ) jqplot_options.legend.labels = chart_legend_labels;
	}
	
	//Axes properties, pie and donut does not have axes
	if( chart_type != "pie" &&  chart_type != "donut"){
		if(!jqplot_options.axes ){
			jqplot_options.axes = {};
			jqplot_options.axes.xaxis = {};
			jqplot_options.axes.yaxis = {};
			
			jqplot_options.axes.yaxis.labelRenderer= jQuery.jqplot.CanvasAxisLabelRenderer;
			jqplot_options.axes.xaxis.labelRenderer= jQuery.jqplot.CanvasAxisLabelRenderer;
			jqplot_options.axes.yaxis.labelOptions = {};
			jqplot_options.axes.xaxis.labelOptions = {};
			
			
			if( dataContainsStringValues == false ){
				jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
			}
			
			//If we have strings in axis
			if( chart_type != "timeSeries" && chart_type != "bezierCurve"){
				if( !jqplot_options.axes.xaxis.renderer ){
					jqplot_options.axes.xaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
				}
			}	
			
			jqplot_options.axes.xaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
			jqplot_options.axes.xaxis.tickOptions = {};
			//If time series in xaxis then set date renderer
			if( chart_type == "timeSeries" || chart_time_series == "true" ){
				jqplot_options.axes.xaxis.renderer = jQuery.jqplot.DateAxisRenderer;
			}
			jqplot_options.axes.yaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
			jqplot_options.axes.yaxis.tickOptions = {};
		}
		else{
			if( !jqplot_options.axes.xaxis ){
				jqplot_options.axes.xaxis = {};
				jqplot_options.axes.xaxis.labelRenderer = jQuery.jqplot.CanvasAxisLabelRenderer;
				jqplot_options.axes.xaxis.labelOptions = {};
				
				if( dataContainsStringValues == false ){
					jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
				}
				
				if( chart_type != "timeSeries" && chart_type != "bezierCurve"  ){
					if( !jqplot_options.axes.xaxis.renderer ){
						jqplot_options.axes.xaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
					}
				}	
				jqplot_options.axes.xaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
				jqplot_options.axes.xaxis.tickOptions = {};
				if( chart_type == "timeSeries" ){
					jqplot_options.axes.xaxis.renderer = jQuery.jqplot.DateAxisRenderer;
				}
			}
			else{
				if( !jqplot_options.axes.xaxis.labelRenderer ){
					jqplot_options.axes.xaxis.labelRenderer = jQuery.jqplot.CanvasAxisLabelRenderer;
				}
				if( !jqplot_options.axes.xaxis.labelOptions ){
					jqplot_options.axes.xaxis.labelOptions = {};
				}

				if( chart_time_series == "true" ){
					if( !jqplot_options.axes.xaxis.renderer )
						jqplot_options.axes.xaxis.renderer = jQuery.jqplot.DateAxisRenderer;
				}
				
				if( chart_type == "timeSeries" && !jqplot_options.axes.xaxis.renderer ){
					jqplot_options.axes.xaxis.renderer = jQuery.jqplot.DateAxisRenderer;
				}
				
				if( !jqplot_options.axes.xaxis.renderer && dataContainsStringValues == false ){
					jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
				}
				
				if( chart_type != "timeSeries" && chart_type != "bezierCurve" ){
					if( !jqplot_options.axes.xaxis.renderer ){
						jqplot_options.axes.xaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
					}
				}
				
				if( !jqplot_options.axes.xaxis.tickRenderer ){
					jqplot_options.axes.xaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
				}
				if(!jqplot_options.axes.xaxis.tickOptions ){
					jqplot_options.axes.xaxis.tickOptions = {};
				}
				
			}
			
			//Case of y-axis. It only has numeric values
			if( !jqplot_options.axes.yaxis ){
				jqplot_options.axes.yaxis = {};
				jqplot_options.axes.yaxis.labelRenderer = jQuery.jqplot.CanvasAxisLabelRenderer;
				jqplot_options.axes.yaxis.labelOptions = {};
				jqplot_options.axes.yaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
				jqplot_options.axes.yaxis.tickOptions = {};
			}
			else{
				if( !jqplot_options.axes.yaxis.labelRenderer ){
					jqplot_options.axes.yaxis.labelRenderer = jQuery.jqplot.CanvasAxisLabelRenderer;
				}
				if( !jqplot_options.axes.yaxis.labelOptions ){
					jqplot_options.axes.yaxis.labelOptions = {};
				}
				
				if( !jqplot_options.axes.yaxis.tickRenderer ){
					jqplot_options.axes.yaxis.tickRenderer = jQuery.jqplot.CanvasAxisTickRenderer;
				}
			}
		}
	}
	
	if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.renderer == jQuery.jqplot.DateAxisRenderer ){
		chart_time_series = "true";
	}
	
	if( data.length > 0 ){
		var data_string = JSON.stringify( data );
		if( data_string != CHART_DATA_EMPTY ){
			//if( url.length > 1 && url[ 2 ].length > 0  )
			//	url[ 2 ] = JSON.stringify(removeUrlIfPossibleFromData( data , jqplot_options , jQuery.parseJSON( url[ 2 ] ) ));
			data = removeValuesIfPossibleFromData( data , jqplot_options );	
		}
		
		try{
			min_x_value = getMin( data , true , false ); max_x_value = getMax( data , true , false );
			min_y_value = getMin( data , false , false ); max_y_value = getMax( data , false , false );
			
			number_distinct_x_values = getDistinct( data , true ); number_distinct_y_values = getDistinct( data , false );
			min_x_value_date = getMin( data , true , true ); max_x_value_date = getMax( data , true , true );
			min_y_value_date = getMin( data , false , true ); max_y_value_date = getMax( data , false , true );
		}catch(e){
			//alert("null values getting min max");
			//Some error or null values
		}
		
		//Increase/Decrease min/max default axes
		var parameter_decrease_min_x = null;
		var parameter_increase_max_x = null;
		var parameter_decrease_min_y = null;
		var parameter_increase_max_y = null;
		if( jqplot_options.axes ){ 
			if( jqplot_options.axes.xaxis ){
				if( jqplot_options.axes.xaxis.decreaseMin !== undefined )
					parameter_decrease_min_x = jqplot_options.axes.xaxis.decreaseMin;
				if( jqplot_options.axes.xaxis.increaseMax !== undefined )
					parameter_increase_max_x = jqplot_options.axes.xaxis.increaseMax;
			}
			if( jqplot_options.axes.yaxis ){
				if( jqplot_options.axes.yaxis.decreaseMin !== undefined )
					parameter_decrease_min_y = jqplot_options.axes.yaxis.decreaseMin;
				if( jqplot_options.axes.yaxis.increaseMax !== undefined )
					parameter_increase_max_y = jqplot_options.axes.yaxis.increaseMax;
			}
		}

		try{
			if( parameter_decrease_min_x !== undefined && parameter_decrease_min_x != null){
				decreaseMin( data , chart_type , chart_time_series , jqplot_options , parameter_decrease_min_x ,chart_datasource , get_data_other_chart , this , true ); 
			}
			if( parameter_increase_max_x !== undefined && parameter_increase_max_x != null ){
				increaseMax( data , chart_type , chart_time_series , jqplot_options , parameter_increase_max_x ,chart_datasource , get_data_other_chart , this , true );
			}
			if( parameter_decrease_min_y !== undefined && parameter_decrease_min_y != null ){
				decreaseMin( data , chart_type , chart_time_series , jqplot_options , parameter_decrease_min_y ,chart_datasource , get_data_other_chart , this , false ); 
			}
			if( parameter_increase_max_y !== undefined && parameter_increase_max_y != null ){
				increaseMax( data , chart_type , chart_time_series , jqplot_options , parameter_increase_max_y ,chart_datasource , get_data_other_chart , this , false );
			}
		}catch(e){
			return "<div class='aui-message error'>Error rendering chart: " + e +" </div>";
		}

		//Show only integer values in axes
		if( !jqplot_options.stackSeries ){
			if( onlyIntegerValuesInData(data, false ) == true ){
				if( jqplot_options.axes && jqplot_options.axes.yaxis && jqplot_options.axes.yaxis.renderer != jQuery.jqplot.CategoryAxisRenderer )
					autoscaleChartCorrectly( data , jqplot_options , false , jQuery("#"+chart_id ).height());
			}
			if( onlyIntegerValuesInData(data, true ) == true ){
				if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.renderer != jQuery.jqplot.CategoryAxisRenderer )
					autoscaleChartCorrectly( data , jqplot_options , true , jQuery("#"+chart_id ).width() );
			}
		}
		
		//Bug with numeric values and same values for an axis
		if( jqplot_options.axes ){
			if( min_x_value == max_x_value && min_x_value != null && jqplot_options.axes.xaxis ){
				if( jqplot_options.axes.xaxis.pad === undefined );
				else{
					if( jqplot_options.axes.xaxis.min === undefined || jqplot_options.axes.xaxis.min == null ){
						jqplot_options.axes.xaxis.min = min_x_value - 1;
					}
					if( jqplot_options.axes.xaxis.max === undefined || jqplot_options.axes.xaxis.max == null ){
						jqplot_options.axes.xaxis.max = max_x_value + 1;
					}
				}
			}
			if( min_y_value == max_y_value && min_y_value != null && jqplot_options.axes.yaxis ){
				if( jqplot_options.axes.yaxis.pad === undefined );
				else{
					if( jqplot_options.axes.yaxis.min === undefined || jqplot_options.axes.yaxis.min == null ){
						jqplot_options.axes.yaxis.min = min_y_value - 1;
					}
					if( jqplot_options.axes.yaxis.max === undefined || jqplot_options.axes.yaxis.max == null ){
						jqplot_options.axes.yaxis.max = max_y_value + 1;
					}
				}
			}
		}
	}
	
	//For stacked values an bar orientation if we have strings on x-axis there would be problems
	if( chart_type != "bubble" && chart_type != "pie" && chart_type != "donut" &&  ( jqplot_options.stackSeries || ( chart_type =="bar" && chart_bar_direction == "horizontal" ) ) ){
		var x_axis_string = true;
		if(( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.renderer && jqplot_options.axes.xaxis.renderer == jQuery.jqplot.DateAxisRenderer )
				|| ( jqplot_options.seriesDefaults && jqplot_options.seriesDefaults.renderer && jqplot_options.seriesDefaults.renderer == jQuery.jqplot.DateAxisRenderer ) ){
				x_axis_string = false;
			}
		
		var ticks = [];
		//If we have strings in x-axis
		if( x_axis_string && data.length > 0 ){
			for( var i = 0 ; i < data[ 0 ].length ; ++i ){
				ticks.push( data[ 0 ][ i ][ 0 ] );
			}
			
			if( !( chart_type =="bar" && chart_bar_direction == "horizontal" ) ){
				var y_values = [];
				for( var i = 0 ; i < data.length ; ++i ){
					var y_rows = [];
					for( var j = 0 ; j < data[ i ].length ; ++j ){
						y_rows.push( data[ i ][ j ][ 1 ] );
					}
					y_values.push( y_rows );
				}
			}
			else{
				//if horizontal then it should be similar to confluence
				var y_values = [];
				for( var i = 0 ; i < data.length ; ++i ){
					var y_rows = [];
					for( var j = 0 ; j < data[ i ].length ; ++j ){
						var aux = [];
						aux.push(data[ i ][ j ][ 1 ]);
						aux.push(data[ i ].length - j);
						y_rows.push( aux );
					}
					y_values.push( y_rows );
				}
				//Reverse ticks
				var rev_ticks = [];
				for( var i = ticks.length - 1 ; i >= 0 ; --i ){
					rev_ticks.push( ticks[ i ] );
				}
				ticks = rev_ticks;
				/*
				//Reverse urls
				var rev_all_url = [];
				for( var j = 0 ; j < 3 ; ++j ){
					var rev_url = [];
					for( var i = url[ j ].length - 1 ; i >= 0 ; --i ){
						rev_url.push( url[ j ][ i ] );
					}
					rev_all_url.push( rev_url );
				}
				url = rev_all_url;*/
			}
			data = y_values;
			
			
			if( !( chart_type =="bar" && chart_bar_direction == "horizontal" ) ){
				//for stack series and strings is requiered to put the strings as labels
				if( !jqplot_options.axes ) {
					jqplot_options.axes = {};
					jqplot_options.axes.xaxis = {};
					jqplot_options.axes.xaxis.ticks = ticks;
				}
				else if( !jqplot_options.axes.xaxis ){
					jqplot_options.axes.xaxis = {};
					jqplot_options.axes.xaxis.ticks = ticks;
				}
				else if( !jqplot_options.axes.xaxis.ticks ) jqplot_options.axes.xaxis.ticks = ticks;
				
			}
		}
		
		//For horizontal bar chart we change the data of axes
		if( !x_axis_string && data.length > 0  && chart_type == "bar" && chart_bar_direction == "horizontal" ){
			for( var i = 0 ; i < data.length ; ++i ){
				for( var j = 0 ; j < data[ i ].length ; ++j ){
					var tmp = data[ i ][ j ][ 0 ];
					data[ i ][ j ][ 0 ] = data[ i ][ j ][ 1 ];
					data[ i ][ j ][ 1 ] = tmp;
				}
			}
		}
		
		if( chart_type == "bar" && chart_bar_direction == "horizontal" ){
			if( !jqplot_options.axes ) {
				jqplot_options.axes = {};
				jqplot_options.axes.xaxis = {};
				jqplot_options.axes.yaxis = {};
				if( chart_time_series == "true" ){
					jqplot_options.axes.yaxis.renderer = jQuery.jqplot.DateAxisRenderer;
				}
				else{
					jqplot_options.axes.yaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
					if( x_axis_string ) jqplot_options.axes.yaxis.ticks = ticks;
				}
				jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
			}
			else{
				if( jqplot_options.axes.yaxis ){
					if( jqplot_options.axes.xaxis ){
						var tmp = jqplot_options.axes.xaxis;
						jqplot_options.axes.xaxis = jqplot_options.axes.yaxis;
						jqplot_options.axes.yaxis = tmp;
						if( chart_time_series == "false" ){
							if( x_axis_string ) jqplot_options.axes.yaxis.ticks = ticks;
						}
					}
					else{
						jqplot_options.axes.xaxis = jqplot_options.axes.yaxis;
						if( chart_time_series == "true" ){
							jqplot_options.axes.yaxis.renderer = jQuery.jqplot.DateAxisRenderer;
						}
						else{
							jqplot_options.axes.yaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
							if( x_axis_string ) jqplot_options.axes.yaxis.ticks = ticks;
						}
					}
					
					if( !jqplot_options.axes.xaxis.renderer ){
						jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
					}
				}
				else{
					if( jqplot_options.axes.xaxis ){
						jqplot_options.axes.yaxis = jqplot_options.axes.xaxis;
					}
					else{
						jqplot_options.axes.xaxis = {};
						jqplot_options.axes.yaxis = {};
						if( chart_time_series == "true" ){
							jqplot_options.axes.yaxis.renderer = jQuery.jqplot.DateAxisRenderer;
						}
						else{
							jqplot_options.axes.yaxis.renderer = jQuery.jqplot.CategoryAxisRenderer;
							if( x_axis_string ) jqplot_options.axes.yaxis.ticks = ticks;
						}
					}
					if( !jqplot_options.axes.xaxis.renderer ){
						jqplot_options.axes.xaxis.renderer = jQuery.jqplot.LinearAxisRenderer;
					}
				}
			}
		}
	}

	//For bubble zoom does not work correctly
	if( chart_type == "bubble" && jqplot_options.cursor ){
		jqplot_options.cursor.show = false;
	}

	if( data.length > 0 ){
		try
		{
			chartObj.plot = jQuery.jqplot( chart_id , data , jqplot_options );
		}catch(e){
			return "<div class='aui-message error'>Error rendering chart: " + e +" </div>";
		}
	}
	
	/*
	if( !chartObj.contextMenu ){
		chartObj.contextMenu = jQuery("#" + chart_id + "context-menu").contextmenu({
			items:[ {
				text: "View Chart Image",	
				icon: AJS.gadget.getBaseUrl() + "/download/resources/com.zagile.salesforce.ZSalesforceJIRA:sfjira-context-menu/images/chart.gif",
				action:function( obj ){
					var imgStr = jQuery("#" + chart_id).jqplotToImageElemStr({});
					imgStr = "<html><body>" + imgStr + "</body></html>";
					var w = window.open('' ,'' ,'width=700,height=400,resizable=1,scrollbars=1');
					w.document.open();
					w.document.write(imgStr);
					w.document.close();
					w = null;
				}
			}]
		});
	}*/

	//Add text No Data Available
	if( !get_data_other_chart && current_data_string == CHART_DATA_EMPTY  ){
		jQuery("<div class=\"my-jqplot-title\" style=\"font-size:15px; position:absolute;text-align:center;padding-top: "+(jQuery("#" + chart_id + " .jqplot-series-canvas").height()/2).toString()+"px;width:100%\">No Data Available</div>").insertAfter( "#" + chart_id + " .jqplot-grid-canvas");
	}
	return "";
}

function changeMouseIcon( jqplot_options , chart_id ){
	var chart_style = "default";
	if( jqplot_options.cursor ){
		if( jqplot_options.cursor.zoom ){
			chart_style = "crosshair";
		}
		if( jqplot_options.cursor.style === undefined );
		else chart_style = jqplot_options.cursor.style;
	}
	
	jQuery("#" + chart_id ).bind('jqplotMouseMove', function(ev, gridpos, datapos, neighbor, plot) { 
		if( neighbor && neighbor.pointIndex != null ){
			jQuery('.jqplot-event-canvas' , this ).css( 'cursor', 'pointer' );
		}else 
			jQuery('.jqplot-event-canvas' , this ).css( 'cursor', chart_style );
	});  
}

/***
 * Function to get legend labels from datasource and combine with labels entered by user
 */
function getLegendDataSource( legend_labels_datasource , columns , dataSource , chart_legend_labels , chart_type ){
	var legend_source = [];
	//For pie chart the legend will be x-axis values
	if( chart_type == "pie" || chart_type == "donut"){
		for( var i = 0 ; i < dataSource.length ; ++i )
			for( var j = 0 ; j < dataSource[ i ].length ; ++j )
				legend_source.push("");
		
	}
	else{
		for( var i = 0 ; i < columns.length ; ++i ){
			if( dataSource.length > columns[ i ] ){
				legend_source.push( legend_labels_datasource[ columns[ i ] ] );
			}
		}
	}
	var min = legend_source.length;
	if( chart_legend_labels.length < min ) min = chart_legend_labels.length;
	var legend_data = [];
	for( var i = 0 ; i < min ; ++i ){
		if( chart_legend_labels[ i ].trim().length == 0 ){
			legend_data.push( legend_source[ i ].trim() );
		}
		else legend_data.push( chart_legend_labels[ i ].trim() )
	}
	
	if( chart_legend_labels > min ){
		for( var i = min ; i < chart_legend_labels.length ; ++i ){
			legend_data.push( chart_legend_labels[ i ].trim() );
		}
	}
	else {
		for( var i = min ; i < legend_source.length ; ++i ){
			legend_data.push( legend_source[ i ].trim() );
		}
	}
	return legend_data
}

/***
 * Given a json array as data for bubble chart is requiered other kind of format for this data.
 * Bubble format data: [ x , y ,radio , optional label ]
 */
function convertDataToBubble( data ){
	var new_data = [];
	if( data.length < 2 || data.length > 3 || data[ 0 ].length == 0 ) return data;
	for( var i = 0 ; i < data[ 0 ].length ; ++i ){
		if( data.length == 3 ) new_data.push( [data[ 0 ][ i ][ 0 ] , data[ 0 ][ i ][ 1 ] , data[ 1 ][ i ][ 1 ] , data[ 2 ][ i ][ 1 ] + '' ] );
		else new_data.push( [data[ 0 ][ i ][ 0 ] , data[ 0 ][ i ][ 1 ] , data[ 1 ][ i ][ 1 ] ] );
	}
	data = []; data.push( new_data );
	return data;
}
	
/**
 * Decrement min X values by a factor
 */
function decreaseMin( data , chart_type , chart_time_series, jqplot_options , decrement , chart_datasource , get_data_other_chart , current , x_axis ){
	var time = 0 , minValue = null;
	if( !x_axis ){
		reduceMinbyType( data , jqplot_options , decrement , false , x_axis  );
	}
	else if( chart_type == "timeSeries" || chart_time_series == "true" ){
		reduceMinbyType( data , jqplot_options , decrement , true , x_axis  );
	}
	else if( get_data_other_chart  ){
		if( jQuery( "#" + chart_datasource ).attr("data-date") == "false" && jQuery( "#" + chart_datasource ).attr("data-string") == "false" ){
			reduceMinbyType( data , jqplot_options , decrement , false , x_axis );
		}
	}
	else{
		if( jQuery(current).attr("data-date") == "false" && jQuery(current).attr("data-string") == "false" ){
			reduceMinbyType( data , jqplot_options , decrement , false , x_axis );
		}
	}
}

function reduceMinbyType( data , jqplot_options , decrement , is_date , x_axis){
	var minValue = null , time;
	minValue = getMin( data , x_axis , is_date );
	
	if( minValue != null ){
		
		if( x_axis ){
			if( (!jqplot_options.axes || !jqplot_options.axes.xaxis ) || jqplot_options.axes && jqplot_options.axes.xaxis && ( jqplot_options.axes.xaxis.min === undefined || jqplot_options.axes.xaxis.min == null ) ){
				time = minValue - decrement;
				if( is_date ){
					var date = new Date(time);
					jqplot_options.axes.xaxis.min = date;
				}
				else
					jqplot_options.axes.xaxis.min = time;
			}
		}
		else{
			if( (!jqplot_options.axes || !jqplot_options.axes.yaxis ) || jqplot_options.axes && jqplot_options.axes.yaxis && ( jqplot_options.axes.yaxis.min === undefined || jqplot_options.axes.yaxis.min == null ) ){
				time = minValue - decrement;
				if( is_date ){
					var date = new Date(time);
					jqplot_options.axes.yaxis.min = date;
				}
				else
					jqplot_options.axes.yaxis.min = time;
			}
		}
	}
}


function increaseMax( data , chart_type , chart_time_series ,jqplot_options , increment , chart_datasource , get_data_other_chart , current , x_axis ){
	var time = 0 , minValue = null;
	if( !x_axis ){
		increaseMaxbyType( data , jqplot_options , increment , false , x_axis  );
	}
	else if( chart_type == "timeSeries" || chart_time_series == "true" ){
		increaseMaxbyType( data , jqplot_options , increment , true , x_axis );
	}
	else if( get_data_other_chart  ){
		if( jQuery( "#" + chart_datasource ).attr("data-date") == "false" && jQuery( "#" + chart_datasource ).attr("data-string") == "false" ){
			increaseMaxbyType( data ,  jqplot_options , increment , false , x_axis );
		}
	}
	else{
		if( jQuery(current).attr("data-date") == "false" && jQuery(current).attr("data-string") == "false" ){
			increaseMaxbyType( data , jqplot_options , increment , false , x_axis );
		}
	}
	
}

function increaseMaxbyType( data , jqplot_options , increment , is_date , x_axis ){
	var maxValue = null , time;
	maxValue = getMax( data , x_axis , is_date );
	//alert( "max " + maxValue );
	if( maxValue != null ){
		if( x_axis ){
			//alert("x_axis ");
			if( (!jqplot_options.axes || !jqplot_options.axes.xaxis ) || jqplot_options.axes && jqplot_options.axes.xaxis && ( jqplot_options.axes.xaxis.max === undefined || jqplot_options.axes.xaxis.max == null ) ){
				time = maxValue + increment;
				if( is_date ){
					var date = new Date(time);
					jqplot_options.axes.xaxis.max = date;
				}
				else
					jqplot_options.axes.xaxis.max = time;
			}
		}
		else{
			if( (!jqplot_options.axes || !jqplot_options.axes.yaxis ) || jqplot_options.axes && jqplot_options.axes.yaxis && ( jqplot_options.axes.yaxis.max === undefined || jqplot_options.axes.yaxis.max == null ) ){
				time = maxValue + increment;
				if( is_date ){
					var date = new Date(time);
					jqplot_options.axes.yaxis.max = date;
				}
				else
					jqplot_options.axes.yaxis.max = time;
			}
		}
	}
}

//Auxiliar Functions
function getMax( data , x_axis , is_date ){
	var maxValue = null , time;
	for( var ii = 0 ; ii < data.length ; ++ii ){
		if( data[ ii ].length > 0 ){
			if( data[ ii ][ 0 ].length > 0 ){
				var first_data = data[ ii ][ 0 ][ 0 ];
				if( !x_axis ){
					first_data = data[ ii ][ 0 ][ 1 ];
				}
				if( is_date && data[ ii ][ 0 ][ 0 ] != null ){
					var date = new Date(data[ ii ][ 0 ][ 0 ]);
					if( maxValue == null || (maxValue != null && date.getTime() > maxValue) )
						maxValue = date.getTime();
				}
				else{
					if( first_data != null ){
						if( maxValue == null || (maxValue != null && first_data > maxValue) )
							maxValue = first_data;
					}
				}
			}
			for( var i = 1 ; i < data[ ii ].length ; ++i ){
				var time = data[ ii ][ i ][ 0 ];
				if( !x_axis ){
					time = data[ ii ][ i ][ 1 ];
				}
				if( is_date && time != null )
					time = new Date(time).getTime();
				
				if( maxValue == null ){
					maxValue = time;
				}
				else if( time != null && time > maxValue ){
					maxValue = time;
				}
			}
		}
	}
	return maxValue;
}

function getMin( data , x_axis , is_date ){
	var minValue = null , time;
	for( var ii = 0 ; ii < data.length ; ++ii ){
		if( data[ ii ].length > 0 ){
			if( data[ ii ][ 0 ].length > 0 ){
				var first_data = data[ ii ][ 0 ][ 0 ];
				if( !x_axis ){
					first_data = data[ ii ][ 0 ][ 1 ];
				}
				
				if( is_date && data[ ii ][ 0 ][ 0 ] != null ){
					var date = new Date(data[ ii ][ 0 ][ 0 ]);
					if( minValue == null || (minValue != null && date.getTime() < minValue) )
						minValue = date.getTime();
				}
				else{
					if( first_data != null ){
						if( minValue == null || (minValue != null && first_data < minValue) )
							minValue = first_data;
					}
				}
			}
	
			for( var i = 1 ; i < data[ ii ].length ; ++i ){
				var time = data[ ii ][ i ][ 0 ];
				if( !x_axis ){
					time = data[ ii ][ i ][ 1 ];
				}
				if( is_date && time != null )
					time = new Date(time).getTime();
				
				if( minValue == null ){
					minValue = time;
				}
				else if( time != null && time < minValue ){
					minValue = time;
				}
			}
		}
	}
	return minValue;
}

function getDistinct( data , x_axis ){
	var set = {};
	var list = [];
	for( var ii = 0 ; ii < data.length ; ++ii ){
		if( data[ ii ].length > 0 ){
			for( var i = 0 ; i < data[ ii ].length ; ++i ){
				var value = data[ ii ][ i ][ 0 ];
				if( !x_axis ){
					value = data[ ii ][ i ][ 1 ];
				}
				if( value != null && !set[ value.toString() ] )
					list.push(value.toString());
				set[ value.toString() ] = true;
			}
		}		
	}
	return list.length;
}



function removeUrlIfPossibleFromData( data , jqplot_options , url ){
	
	if( jqplot_options.seriesDefaults && jqplot_options.seriesDefaults.notConsiderValues ){
		var values = jqplot_options.seriesDefaults.notConsiderValues;
		var new_url = [];
		for( var ii = 0 ; ii < data.length ; ++ii ){
			var serie_url = [];
			for( var i = 0 ; i < data[ ii ].length ; ++i ){
				var xValue = data[ii][ i ][ 0 ] , yValue = data[ii][i][1];
				var removeCurrent = false;
				for( var j = 0 ; j < values.length ; ++j ){
					if( yValue == values[ j ] ){
						removeCurrent = true;
						break;
					}
				}
				if( !removeCurrent && url.length > ii && url[ii].length > i ){
					serie_url.push( url[ ii ][ i ] );
				}
			}
			
			new_url.push( serie_url );
		}
		
		return new_url;
	}
	else if( jqplot_options.series ){
		var series = jqplot_options.series;
		var new_url = [];
		for( var ii = 0 ; ii < series.length ; ++ii ){
			var serie_url = [];
			if( series[ ii ].notConsiderValues ){
				var values = series[ ii ].notConsiderValues;
				for( var i = 0 ; i < data[ ii ].length ; ++i ){
					var xValue = data[ii][ i ][ 0 ] , yValue = data[ii][i][1];
					var removeCurrent = false;
					for( var j = 0 ; j < values.length ; ++j ){
						if( yValue == values[ j ] ){
							removeCurrent = true;
							break;
						}
					}
					if( !removeCurrent && url.length > ii && url[ii].length > i ){
						serie_url.push( url[ ii ][ i ] );
					}
				}
				new_url.push( serie_url );
			}
			else
				new_url.push( url[ii] );
		}
		return new_url;
	}
	return url;
	
}


function removeValuesIfPossibleFromData( data , jqplot_options ){
	if( jqplot_options.seriesDefaults && jqplot_options.seriesDefaults.notConsiderValues ){
		var values = jqplot_options.seriesDefaults.notConsiderValues;
		var new_data = [];
		for( var ii = 0 ; ii < data.length ; ++ii ){
			var serie = [];
			var someX = null;
			for( var i = 0 ; i < data[ ii ].length ; ++i ){
				var xValue = data[ii][ i ][ 0 ] , yValue = data[ii][i][1];
				someX = xValue;
				var removeCurrent = false;
				for( var j = 0 ; j < values.length ; ++j ){
					if( yValue == values[ j ] ){
						removeCurrent = true;
						break;
					}
				}
				if( !removeCurrent ){
					serie.push( [ xValue , yValue ] );
				}//mantain x axis
				//else
				//	serie.push( [ xValue , null ] );
			}
			if( serie.length == 0 )
				serie.push([someX,null]);
			
			new_data.push( serie );
		}
		return new_data;
	}
	else if( jqplot_options.series ){
		var series = jqplot_options.series;
		var new_data = [];
		for( var ii = 0 ; ii < series.length ; ++ii ){
			var serie = [];
			if( series[ ii ].notConsiderValues ){
				var values = series[ ii ].notConsiderValues;
				var someX = null;
				for( var i = 0 ; i < data[ ii ].length ; ++i ){
					var xValue = data[ii][ i ][ 0 ] , yValue = data[ii][i][1];
					someX = xValue;
					var removeCurrent = false;
					for( var j = 0 ; j < values.length ; ++j ){
						if( yValue == values[ j ] ){
							removeCurrent = true;
							break;
						}
					}
					if( !removeCurrent ){
						serie.push( [ xValue , yValue ] );
					}
					//mantain x axis
					//else
					//	serie.push( [xValue , null ] );
				}
				
				if( serie.length == 0 )
					serie.push([someX,null]);
				
				new_data.push( serie );
			}
			else
				new_data.push( data[ii] );
		}
		return new_data;
	}
	return data;
}

/**
 * Check if data contains only integer values for an axis
 */
function onlyIntegerValuesInData( data , x_axis ){
	var onlyNull = true;
	for( var ii = 0 ; ii < data.length ; ++ii ){
		if( data[ ii ].length > 0 ){
			for( var i = 0 ; i < data[ ii ].length ; ++i ){
				var value = data[ ii ][ i ][ 0 ];
				if( !x_axis ){
					value = data[ ii ][ i ][ 1 ];
				}
				if( value != null && parseInt(value) != value ){
					return false;
				}
				if( value != null )
					onlyNull = false;
			}
		}		
	}
	return true;
}

/**
 * If we have only integer values then it will be required to set ticks correctly
 */
function autoscaleChartCorrectly( data , jqplot_options , x_axis , large ){
	//If max|min|tickInterval parameters are set then it will not convert to integer automatically
	
	if( x_axis ){
		if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.max !== undefined && jqplot_options.axes.xaxis.max != null && jqplot_options.axes.xaxis.min !== undefined && jqplot_options.axes.xaxis.min != null )
			return;
		if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.tickInterval !== undefined && jqplot_options.axes.xaxis.tickInterval != null  )
			return;
	}
	else{
		if( jqplot_options.axes && jqplot_options.axes.yaxis && jqplot_options.axes.yaxis.max !== undefined && jqplot_options.axes.yaxis.max != null && jqplot_options.axes.yaxis.min !== undefined && jqplot_options.axes.yaxis.min != null  )
			return;
		if( jqplot_options.axes && jqplot_options.axes.yaxis && jqplot_options.axes.yaxis.tickInterval !== undefined && jqplot_options.axes.yaxis.tickInterval != null  )
			return;
	}

	var MAX = Math.floor(large/22) , newTicksInterval = 1,  newMin = 0 , newMax = null;
	var minValue = getMin( data , x_axis ), maxValue = getMax(data , x_axis );
	
	//Allow max or min but not both
	if( x_axis ){
		if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.max !== undefined && jqplot_options.axes.xaxis.max != null )
			maxValue = jqplot_options.axes.xaxis.max - 1;
		if( jqplot_options.axes && jqplot_options.axes.xaxis && jqplot_options.axes.xaxis.min !== undefined && jqplot_options.axes.xaxis.min != null  )
			minValue = jqplot_options.axes.xaxis.min + 1;
	}
	else{
		if( jqplot_options.axes && jqplot_options.axes.yaxis && jqplot_options.axes.yaxis.max !== undefined && jqplot_options.axes.yaxis.max != null  )
			maxValue = jqplot_options.axes.yaxis.max - 1;
		if( jqplot_options.axes && jqplot_options.axes.yaxis && jqplot_options.axes.yaxis.min !== undefined && jqplot_options.axes.yaxis.min != null  )
			minValue = jqplot_options.axes.yaxis.min + 1;
	}

	if( minValue == null || minValue == 0 )
		minValue = 1;
	
	var mid = Math.ceil(MAX/2);
	for( var i = mid ; i < MAX ; ++i ){
	    var numScale = new NiceScale( minValue - 1 , maxValue + 1 , i );
	    numScale.calculate();
	    var n = numScale.getTickSpacing();
	    if( parseInt( n) === n ){
	    	newTicksInterval = n;
	        newMin = numScale.getNiceMin();
	        newMax = numScale.getNiceMax();
	        break;
	    }
	}
	
	if( newMax == null ){
	      for( var i = mid - 1 ; i >= 0 ; --i ){
	        var numScale = new NiceScale( minValue - 1 , maxValue + 1 , i );
	        numScale.calculate();
	        var n = numScale.getTickSpacing();
	        if( parseInt( n) === n ){
	        	newTicksInterval = n;
	            newMin = numScale.getNiceMin();
	            newMax = numScale.getNiceMax();
	            break;
	        }
	    } 
	}

	if( x_axis ){
		if( !jqplot_options.axes ){
			jqplot_options.axes = {};
			jqplot_options.axes.xaxis = {};
			jqplot_options.axes.xaxis.max = newMax;
			jqplot_options.axes.xaxis.min = newMin;
			jqplot_options.axes.xaxis.tickInterval = newTicksInterval;			
		}
		else if( !jqplot_options.axes.xaxis ){
			
			jqplot_options.axes.xaxis = {};
			jqplot_options.axes.xaxis.max = newMax;
			jqplot_options.axes.xaxis.min = newMin;
			jqplot_options.axes.xaxis.tickInterval = newTicksInterval;			
		}
		else{
			
			if( jqplot_options.axes.xaxis.max === undefined || jqplot_options.axes.xaxis.max == null ){
				jqplot_options.axes.xaxis.max = newMax;
				if( jqplot_options.axes.xaxis.min === undefined || jqplot_options.axes.xaxis.min == null ){
					jqplot_options.axes.xaxis.min = newMin;					
				}
				else{
					var displaceMax = newMax + Math.abs(newMin - jqplot_options.axes.xaxis.min);
					jqplot_options.axes.xaxis.max = displaceMax;	
				}
			}
			else{
				var displaceMin = newMin - Math.abs(newMax - jqplot_options.axes.xaxis.max);
				jqplot_options.axes.xaxis.min = displaceMin;
			}
			jqplot_options.axes.xaxis.tickInterval = newTicksInterval;	
		}
	}
	else{
		
		if( !jqplot_options.axes ){
			jqplot_options.axes = {};
			jqplot_options.axes.yaxis = {};
			jqplot_options.axes.yaxis.max = newMax;
			jqplot_options.axes.yaxis.min = newMin;
			jqplot_options.axes.yaxis.tickInterval = newTicksInterval;		
		}
		else if( !jqplot_options.axes.yaxis ){
			jqplot_options.axes.yaxis = {};
			jqplot_options.axes.yaxis.max = newMax;
			jqplot_options.axes.yaxis.min = newMin;
			jqplot_options.axes.yaxis.tickInterval = newTicksInterval;		
		}
		else{
			if( jqplot_options.axes.yaxis.max === undefined || jqplot_options.axes.yaxis.max == null ){
				jqplot_options.axes.yaxis.max = newMax;
				if( jqplot_options.axes.yaxis.min === undefined || jqplot_options.axes.yaxis.min == null ){
					jqplot_options.axes.yaxis.min = newMin;					
				}
				else{
					var displaceMax = newMax + Math.abs(newMin - jqplot_options.axes.yaxis.min);
					jqplot_options.axes.yaxis.max = displaceMax;	
				}
			}
			else{
				var displaceMin = newMin - Math.abs(newMax - jqplot_options.axes.yaxis.max);
				jqplot_options.axes.yaxis.min = displaceMin;
			}
			jqplot_options.axes.yaxis.tickInterval = newTicksInterval;	
		}
	}
}


/**
 * Figure out the axis min, max and number of ticks
 * the min and max will be some multiple of the tick interval,
 * 1*10^n, 2*10^n or 5*10^n.
 */
function NiceScale( min ,  max ,  maxTicks ){	
	this.minPoint = min;
	this.maxPoint = max;
	this.maxTicks = maxTicks;
	this.tickSpacing;
	this.range;
	this.niceMin;
	this.niceMax;
	this.numberTicks;
	this.calculate = function() {
		this.range = this.niceNum(this.maxPoint - this.minPoint, false);
		this.tickSpacing = this.niceNum(this.range / (this.maxTicks - 1), true);
		this.niceMin = Math.floor(this.minPoint / this.tickSpacing) * this.tickSpacing;
		this.niceMax = Math.ceil(this.maxPoint / this.tickSpacing) * this.tickSpacing;
	}
    
	// This will return an interval of form 2 * 10^n, 5 * 10^n or 10 * 10^n
	this.niceNum = function( range, round){
		var exponent;
		var fraction;
		var niceFraction;

		exponent = Math.floor(Math.log(range)/Math.LN10);
		fraction = range / Math.pow(10, exponent);

		if (round) {
			if (fraction < 1.5)
				niceFraction = 1;
			else if (fraction < 3)
				niceFraction = 2;
			else if (fraction < 7)
				niceFraction = 5;
			else
				niceFraction = 10;
		} else {
			if (fraction <= 1)
				niceFraction = 1;
			else if (fraction <= 2)
				niceFraction = 2;
			else if (fraction <= 5)
				niceFraction = 5;
			else
				niceFraction = 10;
		}
		
		return niceFraction * Math.pow(10, exponent);
	}
	
	this.setMaxTicks = function( maxTicks) {
		this.maxTicks = maxTicks;
		this.calculate();
	}
	this.getTickSpacing = function() {
		return this.tickSpacing;
	}
    
    this.getNiceMin = function() {
		return this.niceMin;
	}

	this.getNiceMax = function() {
		return this.niceMax;
	}
	
	this.getNumberTicks = function() {
		return this.numberTicks;
	}
}

String.prototype.ReplaceAll = function(stringToFind,stringToReplace){
    var temp = this;
    var index = temp.indexOf(stringToFind);
        while(index != -1){
            temp = temp.replace(stringToFind,stringToReplace);
            index = temp.indexOf(stringToFind);
        }
        return temp;
    };
    
    /**
     * Check if data contains only string values for an axis
     */
    function onlyStringValuesInData( data , x_axis ){
    	var onlyNull = true;
    	for( var ii = 0 ; ii < data.length ; ++ii ){
    		if( data[ ii ].length > 0 ){
    			for( var i = 0 ; i < data[ ii ].length ; ++i ){
    				var value = data[ ii ][ i ][ 0 ];
    				if( !x_axis ){
    					value = data[ ii ][ i ][ 1 ];
    				}
    				if( value != null && typeof(value) != "string" ){
    					return false;
    				}
    				if( value != null )
    					onlyNull = false;
    			}
    		}		
    	}
    	return true;
    }
