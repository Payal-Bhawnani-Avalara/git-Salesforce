public class AvalaraLoginCtrl {
    public String username {get; set;}
    public String password {get; set;}

    public PageReference login() {
        return Site.login(username, password, '/AvalaraTellUs');
    }
    
    public PageReference checkLogin(){
        PageReference p;
        if(UserInfo.getUserType() != 'Guest'){
            p = Page.AvalaraTellUs;
        }
        return p;
    }
}