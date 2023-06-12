import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        int[][] M = {{1,2,3}, {3, 3, 4}, {3, 2, 1}, {5153, 2, 1}};
        System.out.println(Arrays.toString(row_max(M)));
        System.out.println(Arrays.toString(row_avg(M)));
        System.out.println(norm_inf(M));
    }

    static int[] row_max(int[][] M){
        int current_index = 0;
        int[] result = new int[3];

        for(int i = 0; i < 3; i++){
            int max = -9999;
            for(int j = 0; j < 3; j++){
                if(M[i][j] > max)
                    max = M[i][j];
            }
            result[current_index++] = max;
        }

        return result;
    }

    static String[] row_avg(int[][] M){
        int current_index = 0;
        String[] result = new String[M.length];

        for(int i = 0; i < M.length; i++){
            int sum = 0;
            for(int j = 0; j < M[0].length; j++){
                sum += M[i][j];
            }
            result[current_index++] = String.format("%.2f", (double) sum /M[0].length);
        }

        return result;
    }

    static int norm_inf(int[][] M){
        int current_index = 0;
        int temp[] = new int[M.length];

        for(int i = 0; i < M.length; i++){
            int sum = 0;
            for(int j = 0; j < M[0].length; j++){
                sum += M[i][j];
            }
            temp[current_index++] = sum;
        }

        int max = -9999;

        for(int i = 0; i < M.length; i++){
            if(temp[i] > max)
                max = temp[i];
        }

        return max;
    }

}
