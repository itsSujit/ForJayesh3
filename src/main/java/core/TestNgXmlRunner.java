package core;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        plugin = { "pretty:target/prettyReport.txt", "json:target/cucumber.json", "html:target/cucumber", "testng:target/testng-output.xml" },
        features = "src/test/resources",  
        monochrome = true,  
        glue = { "" }, 
        tags = {"@GoogleSearch, @Login"}
    )
public class TestNgXmlRunner extends AbstractTestNGCucumberTests {

}
