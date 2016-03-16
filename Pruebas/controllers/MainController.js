var app = angular.module("app");

app.controller("MainController", function(GeneralesServices){

    var self = this;
    this.criteria = 'all';
    this.filteredList = [];
    this.fullList =[];
    this.DiasBase =[];
  
    
    this.filterList = function(criteria){
      if(criteria){
        this.criteria = criteria;
        this.filteredList = this.fullList
          .filter(function(user){
            return Dias.Nombre == criteria;
          });
      }else{
        this.criteria = 'all';
        this.filteredList = this.fullList;
      }
    };
  
    GeneralesServices.getDias()
      .then(function(data){
        self.fullList = data;
        self.filteredList = self.fullList; 
      });
      
      
  
});