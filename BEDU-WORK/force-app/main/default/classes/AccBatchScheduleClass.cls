global class AccBatchScheduleClass implements Schedulable {
   
    global void execute(SchedulableContext ctx){
        BatchApexExample accCls = new BatchApexExample();
        String cronStr = '20 30 8 10 2 ?';
        String jobID= System.schedule('Process Acc Records', cronStr, accCls);
    }
}//class
