@isTest
public class SliderComponentControllerTest {

    @isTest
    static void testtoBooleanListWillReturnAllFalseWhenNoDefaultsAreSetOrNothingIsSelected() {
        SetupData setupData = new SetupData(3);
        System.runAs(setupData.runningUser) {
            Test.startTest();
                Integer size = setupData.controller.getResults().size();
                List<Boolean> results = setupData.controller.toBooleanList();
            Test.stopTest();
            System.assertEquals(3, size);
            for (Boolean result : results) {
                System.assertEquals(false, result);
            }
        }
    }

    @isTest
    static void testtoBooleanListWillReturnAllValidReusltWhenDefaultsAreSet() {
        SetupData setupData = new SetupData(3);
        System.runAs(setupData.runningUser) {
            Test.startTest();
                setupData.controller.Defaults = setupData.defaultValues;
                Integer size = setupData.controller.getResults().size();
                List<Boolean> results = setupData.controller.toBooleanList();
            Test.stopTest();
            System.assertEquals(3, size);
            System.assertEquals(false, results[0]);
            System.assertEquals(true, results[1]);
            System.assertEquals(false, results[2]);
        }
    }

    @isTest
    static void testtoBooleanListWillReturnAllValidWhenNoDefaultsAreSetButEverythingIsChecked() {
        SetupData setupData = new SetupData(3);
        System.runAs(setupData.runningUser) {
            Test.startTest();
                Integer size = setupData.controller.getResults().size();
                for (Integer i = 0; i < 3; i++) {
                    setupData.controller.Results[i].Value = true;
                }
                List<Boolean> results = setupData.controller.toBooleanList();
            Test.stopTest();
            System.assertEquals(3, size);
            for (Boolean result : results) {
                System.assertEquals(true, result);
            }
        }
    }

    @isTest
    static void testIfLabelsAreSetTheyShouldBePresentedInWrapper() {
        SetupData setupData = new SetupData(10);
        System.runAs(setupData.runningUser) {
            Test.startTest();
                setupData.controller.Labels = setupData.fieldLabels;
                Integer size = setupData.controller.getResults().size();
                List<SliderComponentController.InputCheckboxWrapper> results = setupData.controller.getResults();
            Test.stopTest();
            System.assertEquals(10, size);
            for (Integer i = 0; i < 3; i++) {
                System.assertEquals(setupData.fieldLabels[i], results[i].Label);
            }
        }
    }

    private class SetupData {
        public SliderComponentController controller;
        public TestPageController parentController;
        public User runningUser;
        public String[] fieldLabels;
        public Boolean[] defaultValues;

        public SetupData(Integer size) {
            runningUser = TestUserBuilder.getBuilder().save().getRecord();
            controller = new SliderComponentController();
            parentController = new TestPageController();
            controller.pageController = parentController;
            controller.key = 'Slider Component';
            controller.resultsSize = size;
            fieldLabels = new String[] {'Test1', 'Test2', 'Test3'};
            defaultValues = new Boolean[] {false, true, false};
        }

    }
    
    private class TestPageController extends PageControllerBase { }
}