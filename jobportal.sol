// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
  // Defining a variable
   address public admin;
    
  // Creating a constructor to
  // use Global variable
    constructor() {    
    admin = msg.sender;  
    }
 
   struct addapplicant{
        string name;
        uint age;
        string Address;
        string reqJob;
    }
    
    //allows admin to edit contract
    mapping (uint => addapplicant) joinee;

    function addApplicant(string memory name,uint _AadharId,uint age,string memory Address,string memory reqJob)public {
        joinee[_AadharId]= addapplicant(name,age,Address,reqJob);
    }
    //allows admin to edit contract
}

contract JobPortal is Ownable{

    //view function reads from blockchain, pure displays values in the function
    function getApplicant(uint _AadharId)public view returns(addapplicant memory){
        return(joinee[_AadharId]);
    }
   //adding a job 
    struct addJob{
        string jobname;
        uint salary;
        string details;
    }
    mapping (string => addJob) newjob;
    function AddJob(string memory jobname,string memory _jobcode,uint salary,string memory details)public {
        newjob[_jobcode]= addJob(jobname,salary,details);
    }
    function getJob(string memory _jobcode)public view returns(addJob memory){
        return newjob[_jobcode];
    }

    //linking job code to AadharId 
    enum Jobcode{AAA,BBB,CCC}
    struct jcode{
        Jobcode jobcode;
    }
    jcode public Jcode;
    function pick_code(Jobcode _jobcode)public returns(Jobcode){
        Jcode.jobcode = _jobcode;
        return (Jcode.jobcode);
    }
    mapping (uint => jcode)linktocode;

    function get_code(uint _AadharId)public view returns(jcode memory){
        return linktocode[_AadharId];
    }
    
    //Applying for available jobs and fetch chosen job
    enum AVAILABLEJOBS{manager,developer,cleaner,electrician,salesman}
    struct Ajobs{
        AVAILABLEJOBS available;
    }
    Ajobs public choosenjob;
    function pick_job(AVAILABLEJOBS _available)public returns(AVAILABLEJOBS){
        choosenjob.available = _available;
        return (choosenjob.available);
    }

    //rating an applicant with_AadharId and fetch rating
    enum Rate{worse,below,average,above,best}
    struct Rating{
        Rate rate;
    }
    Rating public rating;
    function pick_RATING(Rate _rate)public returns(Rate){
    rating.rate = _rate;
        return (rating.rate);
    }
    mapping (uint => Rating)letsrate;
    function view_RATING(uint _AadharId)public view returns(Rating memory){
        return letsrate[_AadharId];
    }
}
