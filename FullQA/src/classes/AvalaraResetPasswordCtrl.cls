public Class AvalaraResetPasswordCtrl{
    
    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    
    public PageReference resetPassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }     
}