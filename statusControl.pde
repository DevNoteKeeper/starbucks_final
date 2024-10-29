class StatusControl{
    Background background;
    boolean isOpen;
    float currentTime;

    StatusControl(Background b){
        background = b;
        isOpen = true;
        currentTime = 8;
    }

    void updatedTime(){
        //like real time, it works 0 to 24
        currentTime += 0.01;
        if(currentTime > 24){
            currentTime = 0;
        }
        checkIsOpen();
        //give current time to change background
        background.updatedColor(currentTime);
        
    }

    void checkIsOpen(){
        //changes to true or false depending on cafe operating hours
        if(currentTime >=8 && currentTime <=20 ){
            background.isOpen = true;
            isOpen = true;
        } else{
            background.isOpen = false;
            isOpen = false;
        }
    }

}