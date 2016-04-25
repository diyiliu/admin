import com.diyiliu.support.util.DateUtil;
import org.junit.Test;

/**
 * Description: MainTest
 * Author: DIYILIU
 * Update: 2016-04-25 10:49
 */
public class MainTest {

    @Test
    public void testDate(){

        System.out.println(DateUtil.stringToDate("2016-01-25 00:00:00", "yyyy-MM-dd HH:mm:ss"));
    }
}
