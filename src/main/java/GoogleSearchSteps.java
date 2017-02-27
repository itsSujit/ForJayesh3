import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import core.BaseSteps;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class GoogleSearchSteps {
    private String termEntered = null;
    protected static WebDriver driver;
    protected WebElement element = null;

    @Given("^A Google search page$")
    public void a_Google_search_page() throws Throwable {
        driver = new BaseSteps().getDriver();
        driver.get("http://www.google.com");
        System.out.println("Current Page title is: " + driver.getTitle());
    }

    @When("^I enter the search term \"([^\"]*)\"$")
    public void i_enter_the_search_term(String query) throws Throwable {
        termEntered = query;
        element = driver.findElement(By.name("q"));
        element.clear();
        element.sendKeys(query);
    }

    @When("^I submit the search by pressing \"([^\"]*)\"$")
    public void i_submit_the_search_by_pressing(String submitType) throws Throwable {
        WebDriverWait wait = new WebDriverWait(driver, 60);
        switch (submitType.toLowerCase()) {
        case "enter":
        case "enter key":
            element.sendKeys(Keys.ENTER);
            break;
        case "search":
        case "search button":
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("btnG")));
            driver.findElement(By.name("btnG")).click();
            break;
        case "i'm feeling lucky button":
        case "i'm feeling lucky":
            break;
        }
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#search li")));
    }

    @Then("^The search result page title should contain the search term$")
    public void the_search_result_page_title_should_contain_the_search_term() throws Throwable {
        String termInTitle = getTermFromTitle();
        //assertEquals(termInTitle, termEntered);
    }

    public String getTermFromTitle() {
        String title = driver.getTitle();
        return title.substring(0, title.indexOf(" - "));
    }
}
