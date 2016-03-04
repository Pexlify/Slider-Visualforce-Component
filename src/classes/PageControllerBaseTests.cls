@isTest
public class PageControllerBaseTests {
    @isTest
    static void testGetThisWillReturnInstanceOfClass() {
        SetupData setupData = new SetupData();
        System.runAs(setupData.runningUser) {
            Test.startTest();
                PageControllerBase instance = setupData.controller.getThis();
            Test.stopTest();
            System.assertEquals(setupData.controller, instance);
        }
    }

    @isTest
    static void testSetComponentControllerMapWillActuallySetNewKeyPairInInnerMap() {
        SetupData setupData = new SetupData();
        System.runAs(setupData.runningUser) {
            Test.startTest();
                for(Integer i = 0; i < 10; i++) {
                    setupData.controller.setComponentControllerMap(String.valueOf(i), setupData.componentControllers[i]);
                }
            Test.stopTest();
            System.assertEquals(10, setupData.controller.getComponentControllerMap().size());
        }
    }

    private class SetupData {
        public PageControllerBase controller;
        public User runningUser;
        public List<ComponentControllerBase> componentControllers;

        public SetupData() {
            runningUser = TestUserBuilder.getBuilder().save().getRecord();
            controller = new PageControllerBase();
            componentControllers = new List<ComponentControllerBase>();
            for (Integer i = 0; i < 10; i++) {
                componentControllers.add(new ComponentControllerBase());
            }
        }

    }
}