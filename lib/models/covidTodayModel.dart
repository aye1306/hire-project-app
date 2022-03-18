class CovidTodayModel {

  String? txnDate;
  int? newCase;
  int? totalCase;
  int? newCaseExcludeabroad;
  int? totalCaseExcludeabroad;
  int? newDeath;
  int? totalDeath;
  int? newRecovered;
  int? totalRecovered;
  String? updateDate;

  CovidTodayModel({
    this.txnDate,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.newRecovered,
    this.totalRecovered,
    this.updateDate,
  });
  CovidTodayModel.fromJson(Map<String, dynamic> json) {
    txnDate = json['txn_date']?.toString();
    newCase = json['new_case']?.toInt();
    totalCase = json['total_case']?.toInt();
    newCaseExcludeabroad = json['new_case_excludeabroad']?.toInt();
    totalCaseExcludeabroad = json['total_case_excludeabroad']?.toInt();
    newDeath = json['new_death']?.toInt();
    totalDeath = json['total_death']?.toInt();
    newRecovered = json['new_recovered']?.toInt();
    totalRecovered = json['total_recovered']?.toInt();
    updateDate = json['update_date']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['txn_date'] = txnDate;
    data['new_case'] = newCase;
    data['total_case'] = totalCase;
    data['new_case_excludeabroad'] = newCaseExcludeabroad;
    data['total_case_excludeabroad'] = totalCaseExcludeabroad;
    data['new_death'] = newDeath;
    data['total_death'] = totalDeath;
    data['new_recovered'] = newRecovered;
    data['total_recovered'] = totalRecovered;
    data['update_date'] = updateDate;
    return data;
  }
}
