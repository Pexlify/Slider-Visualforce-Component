@isTest
public class ComponentControllerBaseTests {

    @isTest
    static void testSetKeyWillBindComponentControllerToParent() {
        SetupData setupData = new SetupData();
        System.runAs(setupData.runningUser) {
            Test.startTest();
                setupData.controller.pageController = setupData.parentController;
                setupData.controller.key = 'componentId';
            Test.stopTest();
            System.assertEquals(1, setupData.parentController.getComponentControllerMap().size());
            System.assertEquals(setupData.controller, setupData.parentController.getComponentControllerMap().get('componentId'));
        }
    }

    private class SetupData {
        public PageControllerBase parentController;
        public User runningUser;
        public ComponentControllerBase controller;

        public SetupData() {
            runningUser = TestUserBuilder.getBuilder().save().getRecord();
            controller = new ComponentControllerBase();
            parentController = new PageControllerBase();
        }

    }
}