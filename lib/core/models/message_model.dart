class Message{
  final int id;
  final text;
  const Message({required this.id,required this.text});
  int getMessageIndex(bool isChatCreator){
    if(isChatCreator){
      if(id == 1){
        return 1;
      }
      if(id == 2){
        return 2;
      }
    }
    if(!isChatCreator){
      if(id == 1){
        return 2;
      }
      if(id == 2){
        return 1;
      }
    }
    return 0 ;
  }
}