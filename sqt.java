import java.util.ArrayList;

public class sqt {
    public static void main(String [] args){
        System.out.println(sqrt(25.25f));
        System.out.println(5.02493*5.02493);
    }
    static float sqrt(float n){
        float num=n;
        float res= 0;
        float c=0;
        float r=0;

        int d=1;
        int db=1;
        ArrayList<Float> chunks = new ArrayList<>();
        while (num>0) {
            float temp=num%100;
            chunks.add(temp);
            num= (num-temp)/100;
        }
        
        int ind= chunks.size()-1;
        while (ind >=0) {
            float chunk=r*100+chunks.get(ind);
            ind--;
            for(int i=9; i>=0; i--){
                if( (c*10+i)*i <= chunk){
                    res=res*10+i;
                    c = c*10+i;
                    r = chunk - c*i;
                    c = c+i;
                    break;
                }
            }
            System.out.println(chunk);
            System.out.println(c);
            if (r!=0 && d<=5 && ind==-1) {
                d++;
                ind=0;
                chunks.set(0, 0.0f);
                db*=10;
            }
        }
        return res/db;
    }
}

//       999
//    9 |99 80 01
//      |81 
//   189|1880 01
//      |1701
//  1989|17901
//      |17901
//      |0