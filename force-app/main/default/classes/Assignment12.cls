public class Assignment12 {
    Public static void method(integer n){

        String str1 = '#';
        String str2 ='#';
        for(integer i=0;i<n;i++) {
            str1+='#';
            if(i==n-1)
                str2+='#';
            else
                str2+='_';
        }
        for(integer i=0;i<n;i++){
            if(i ==0 || i==n-1)
                System.debug(str1);
            else
                System.debug(str2);
        }
    }
}