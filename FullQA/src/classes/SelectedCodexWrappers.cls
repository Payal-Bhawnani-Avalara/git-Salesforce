global class SelectedCodexWrappers {
	public Boolean isSelected {get;set;}
    public Codex__c codex {get;set;}        
    
    public SelectedCodexWrappers(Codex__c cod, Boolean isSelected){
            this.codex = cod;
            this.isSelected = isSelected;
        }
}