public class SliderExampleController extends PageControllerBase {

    public String[] getLabels() {
        return new String[]{'Is Feature-2891 Enabled?', 'Is Feature-2731 Enabled?', 'Is Feature-1231 Enabled?', 'Is Feature-6789 Enabled?'};
    }

    public Boolean[] getDefaults() {
        return new Boolean[]{false, false, true, false};
    }
}