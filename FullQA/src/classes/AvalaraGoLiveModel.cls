public class AvalaraGoLiveModel{

    public class GoLiveResponse{
        public String id;
        public String name;
        public String status;
        // date format was not consistent so not using date
        public String effectiveDate;
        public String createdDate;
        public String accountStatusId;
        public List<ValueX> value;
        public boolean isFundingSetup;
        public GoLiveResponse(){
            this.value = new List<ValueX>();
        }
    }

    public class ValueX{
        public String id;
        public String effectiveDate;
        public String createdDate;
        public boolean isFundingSetup;
    }
    public class GoLiveRequest{}
}