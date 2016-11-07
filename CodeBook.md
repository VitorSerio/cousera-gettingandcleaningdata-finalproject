Tables and variables in the data set:  

Table 1:  
    name: readings  
    variables:  
        set:  
            class: character  
            values: "test"  
                    "train"  
            description: determines if the observation belongs to the test or to the train set.  
        window:  
            class: integer  
            values: 1 to 7352  
            description: identification of the window of readings for each set.  
            note: window for the test set goes only up to 2947.  
        subject:  
            class: integer  
            values: 1 to 30  
            description: identification of the subject.  
        activity:  
            class: character  
            values: "walking"  
                    "walking upstairs"  
                    "walking downstairs"  
                    "sitting"  
                    "standing"  
                    "laying"  
            descriptions: type of activity that was being executed.  
        reading:  
            class: integer  
            values: 1 to 128  
            description: identification of the readings for each window.  
        readingtype:  
            class: character  
            values: "body linear acceleration"  
                    "body angular velocity"  
                    "total linear acceleration"  
            description: type of the reading.  
        readingaxis:  
            class: character  
            values: "x"  
                    "y"  
                    "z"  
            description: axis on which the reading was taken.  
        readingvalue:  
            class: numeric  
            values: multiple  
            description: actual values of the readings.  
            
Table 2:  
    name: features  
    variables:  
        set:  
            class: character  
            values: "test"  
                    "train"  
            description: determines if the observation belongs to the test or to the train set.  
        window:  
            class: integer  
            values: 1 to 7352  
            description: identification of the window of readings for each set.  
            note: window for the test set goes only up to 2947.  