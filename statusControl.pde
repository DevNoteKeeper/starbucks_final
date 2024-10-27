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
        currentTime += 0.01;
        if(currentTime > 24){
            currentTime = 0;
        }
        checkIsOpen();
        background.drawDayTime(currentTime);
        
    }

    void checkIsOpen(){
        if(currentTime >=8 && currentTime <=20 ){
            background.isOpen = true;
            isOpen = true;
        } else{
            background.isOpen = false;
            isOpen = false;
        }
    }

}