@isTest
public class SliderExampleControllerTests {
    @isTest
    static void testGetLabelsWillReturnValidStringList() {
        SetupData setupData = new SetupData();
        System.runAs(setupData.runningUser) {
            Test.startTest();
                List<String> labels = setupData.controller.getLabels();
            Test.stopTest();
            System.assertEquals(4, labels.size());
            System.assertEquals('Is Feature-2891 Enabled?', labels[0]);
            System.assertEquals('Is Feature-2731 Enabled?', labels[1]);
            System.assertEquals('Is Feature-1231 Enabled?', labels[2]);            
            System.assertEquals('Is Feature-6789 Enabled?', labels[3]);
        }
    }

    @isTest
    static void testGetDefaultsWillReturnValidBooleanList() {
        SetupData setupData = new SetupData();
        System.runAs(setupData.runningUser) {
            Test.startTest();
                List<Boolean> defaults = setupData.controller.getDefaults();
            Test.stopTest();
            System.assertEquals(4, defaults.size());
            System.assertEquals(false, defaults[0]);
            System.assertEquals(false, defaults[1]);
            System.assertEquals(true, defaults[2]);            
            System.assertEquals(false, defaults[3]);
        }
    }

    private class SetupData {
        public SliderExampleController controller;
        public User runningUser;

        public SetupData() {
            runningUser = TestUserBuilder.getBuilder().save().getRecord();
            controller = new SliderExampleController();
        }

    }
}