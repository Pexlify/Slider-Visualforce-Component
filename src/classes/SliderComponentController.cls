public class SliderComponentController extends ComponentControllerBase {
    public List<InputCheckboxWrapper> Results;
    public Integer ResultsSize {get; set;}
    public List<String> Labels {get; set;}
    public List<Boolean> Defaults {get; set;}

    public SliderComponentController() {
        Results = new List<InputCheckboxWrapper>();
    }

    public List<InputCheckboxWrapper> getResults() {
        if (Results.isEmpty()) {
            for (Integer index = 0; index < resultsSize; index++) {
                Results.add(new InputCheckboxWrapper());
            }
            setLabels();
            setDefaults();
        }

        return Results;
    }

    public void setLabels() {
        if (Labels != null && !Labels.isEmpty()) {
            for (Integer index = 0; index < Labels.size(); index++) {
                Results[index].Label = Labels[index];
            }
        }
    }

    public void setDefaults() {
        if (Defaults != null && !Defaults.isEmpty()) {
            for (Integer index = 0; index < Defaults.size(); index++) {
                Results[index].Value = Defaults[index];
            }
        }
    }

    public List<Boolean> toBooleanList() {
        List<Boolean> booleanList = new List<Boolean>();
        for (InputCheckboxWrapper result : Results) {
            booleanList.add(result.Value);
        } 
        return booleanList;
    }

    public class InputCheckboxWrapper {
        public Boolean Value {get; set;}
        public String Label {get; set;}
    } 
}