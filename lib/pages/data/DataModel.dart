class DataModel {
  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  void updateData(int clicksPerpage, int correctAns, int incorrectAns,
      int timeFirstClick, num duration, List timeIntervalClicks) {
    this.clicksPerpage = clicksPerpage;
    this.correctAns = correctAns;
    this.incorrectAns = incorrectAns;
    this.timeFirstClick = timeFirstClick;
    this.duration = duration;
    this.timeIntervalClicks = timeIntervalClicks;
  }

  int getClicksPerPage() {
    return clicksPerpage;
  }

  int getcorrectAns() {
    return correctAns;
  }

  int getincorrectAns() {
    return incorrectAns;
  }

  int gettimeFirstClick() {
    return timeFirstClick;
  }

  num getduration() {
    return duration;
  }

  List gettimeIntervalClicks() {
    return timeIntervalClicks;
  }
}
