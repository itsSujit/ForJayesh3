package core;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class BaseSteps {

    public static WebDriver driver ;
    public BaseSteps() {
        // TODO Auto-generated constructor stub
        
    }

    public WebDriver getDriver(){
        return driver = new FirefoxDriver();
    }
}

