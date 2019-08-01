public class ZinfiSyncOnline 
{
    @future (callout=true) 
    public static void sendAttachDetailsFutureCall(Set<Id> AttachmentIdList)
    {
        List<AttachmentWrapper> WList=new   List<AttachmentWrapper>();
          List<Attachment> AttachList = [SELECT Body,BodyLength,ContentType,Description,Id,IsPrivate,Name,ParentId 
          FROM Attachment
          Where ID in:AttachmentIdList];
          for(Attachment n :AttachList)
          {
            AttachmentWrapper nw=new AttachmentWrapper();
            nw.Id=n.Id;
            nw.IsPrivate=n.IsPrivate;
         //   nw.Body=EncodingUtil.base64Encode(n.Body);
            nw.BodyLength=n.BodyLength;
            nw.ContentType=n.ContentType;
            nw.Name=n.Name;
            nw.ParentId=n.ParentId;
            WList.add(nw);
          }
          String strbdy = JSON.serialize(WList);
          System.debug(':::strbdy='+ strbdy);
         Http htp = new Http();
            HttpRequest hr = new HttpRequest();
            hr.setMethod('POST');
            hr.setEndPoint(Label.WebhookEndPoint);
          
            hr.setBody(strbdy);
            hr.setHeader('Content-Type', 'application/json');
            hr.setHeader('Accept', 'application/json');
            hr.setHeader('WebToken',Label.WebToken);
            hr.setHeader('WebHook','44AB78B1-4993-4140-9E24-66196083E217');
            System.debug(':::hr='+ hr);
             try{
              HttpResponse hs = htp.send(hr);
              String rsStr = hs.getBody();
                System.debug('***** response=' + rsStr);
                System.debug('***** StatusCode =' + hs.getStatusCode() );
                
             }catch(Exception e)
             {
              System.debug('***** Exception=' + e.getMessage());
             }
          
    }
    @future (callout=true) 
    public static void sendNoteDetailsFutureCall(Set<Id> NoteIdList)
    {
        List<NoteWrapper> NoteWList=new   List<NoteWrapper>();
          List<Note> NoteList = [SELECT Id,IsPrivate,Body,CreatedDate,ParentId,Title FROM Note
          Where ID in: NoteIdList];
          for(Note n :NoteList)
          {
            NoteWrapper nw=new NoteWrapper();
            nw.Id=n.Id;
            nw.IsPrivate=n.IsPrivate;
            nw.Body=n.Body;
            nw.CreatedDate=n.CreatedDate;
            nw.Title=n.Title;
            nw.ParentId=n.ParentId;
            NoteWList.add(nw);
          }
          String strbdy = JSON.serialize(NoteWList);
          System.debug(':::strbdy='+ strbdy);
         Http htp = new Http();
            HttpRequest hr = new HttpRequest();
            hr.setMethod('POST');
            hr.setEndPoint(Label.WebhookEndPoint);
          
            hr.setBody(strbdy);
            hr.setHeader('Content-Type', 'application/json');
            hr.setHeader('Accept', 'application/json');
            hr.setHeader('WebToken',Label.WebToken);
            hr.setHeader('WebHook',Label.WebHook);
            System.debug(':::hr='+ hr);
             try{
              HttpResponse hs = htp.send(hr);
              String rsStr = hs.getBody();
                System.debug('***** response=' + rsStr);
                System.debug('***** StatusCode =' + hs.getStatusCode() );
                
             }catch(Exception e)
             {
              System.debug('***** Exception=' + e.getMessage());
             }
          
    }
    
    
    public class AttachmentWrapper
    {
        Public string Id;
        public boolean IsPrivate;
        public string Name;
        public string Body;
        public integer BodyLength;
        public string Description;
        public string ParentId;
        public string ContentType;
          
    }
    public class NoteWrapper
    {
        Public string Id;
        Public Boolean IsPrivate;
        Public string Body;
        Public DateTime CreatedDate;  
        public string Title;
        public string ParentId;
        
    }
}