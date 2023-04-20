public class Assignment8 {

    public integer method(integer a,integer b,integer c)
    {
        integer count=0;
        do
        {
            if(a>=4 && b>=1 && c>=2)
            {
                count++;
            }
            a=a-4;
            b=b-1;
            c=c-2;
        }
        while(a>=4 &&b>=1 && c>=2);
        return count;
    }
}