import org.sdn.client.StatisticClient;
import org.sdn.system.SystemInitialize;


public class Application {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub                                                                                                                                                                                            
	     SystemInitialize.start();
	     Thread.sleep(5000);	
	    /* policyExecutor pex=new policyExecutor();
	     pex.excuteRandomPolicySecure("Shamir");*/
         StatisticClient client= new StatisticClient();
         client.start();
         
        /*--------------task of thread one to write to the database------------*
       
		/*--------------task of thread two make the decision--------------*/
		// System.out.println(VIB.getPacketsAggregatePerSwitchFull().size());
	   /*String srcIP="10.0.0.1";
		String dstIP="10.0.0.3";
	   tcpClient tclient=new tcpClient();
	   tclient.sendMigrationCommand(srcIP,dstIP);*/
		
	}

}