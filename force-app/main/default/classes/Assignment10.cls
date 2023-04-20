public class Assignment10 {
	   public static void method()
    {
        integer[] hl = new integer[]{10,12,6,52,17,43,7};
        for(integer i=1;i<hl.size()-1;i++)
        {
            if(hl[i]>hl[i-1])
            {
                if(hl[i]>hl[i+1])
                {
                    System.debug(hl[i]);
                }
                
            }
        }

}
}