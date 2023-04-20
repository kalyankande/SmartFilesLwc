public class Assignment11 {
        public  void method(String s1,String s2)
    {
        integer count=0;
        List<String> tempArray1 = s1.split('');
        List<String> tempArray2 = s2.split('');
        for(integer i=0;i<s1.length()-1;i++)
        {
            for(integer j=0;j<s2.length()-1;j++)
            {
                if(tempArray1[i]==(tempArray2[j]))
                {
                    count++;
                }
            }
        }
        System.debug(count);
    }

}