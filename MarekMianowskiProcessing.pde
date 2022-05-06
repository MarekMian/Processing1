int x=20;
int y=20;
Table kill;
int key=0;
int size=0;
int food=0;
int foodx=1;
int foody=1;
boolean v=false;
boolean die=false;
void setup() {
  size(880,880);
  kill = new Table();
  kill.addColumn("x", Table.INT);
  kill.addColumn("y", Table.INT);
  kill.addRow();
  kill.setInt(0,"x",20);
  kill.setInt(0,"y",20);
}

void draw() {
  background (0);
  fill (50,200,80);
  for(int i=0; i<=size;i++)
  {
  rect(kill.getInt(i,"x")*22, kill.getInt(i,"y")*22, 22, 22);
  }
  fill (250,80,50);
  rect(foodx*22, foody*22, 22, 22);
    if(frameCount%8==1)
    {
      die=check(size, x, y);
      if(die==true)
      {
        for(int g=0; g<size; g++)
        {
        kill.removeRow(0);
        }
        size=0;
        x=20;
        y=20;
        kill.setInt(0,"x",20);
        kill.setInt(0,"y",20);
        key=0;
        food=0;
        
      }
      if(keyPressed){
  if(keyCode==LEFT){
    key=2;
  }
  if(keyCode==RIGHT){
    key=4;
  }
  if(keyCode==UP){
    key=3;
  }
  if(keyCode==DOWN){
    key=1;
  }
 }
      switch (key) {
        case 4:
        kill.addRow();
        size=size+1;
        kill.setInt(size,"x",x);
        x=x+1;
        kill.setInt(size,"y",y);
        break;
        case 1:
        kill.addRow();
        size=size+1;
        kill.setInt(size,"x",x);
        kill.setInt(size,"y",y);
        y=y+1;
        break;
        case 2:
        kill.addRow();
        size=size+1;
        kill.setInt(size,"x",x);
        x=x-1;
        kill.setInt(size,"y",y);
        break;
        case 3:
        kill.addRow();
        size=size+1;
        kill.setInt(size,"x",x);
        kill.setInt(size,"y",y);
        y=y-1;
        break;
    }
    if(x<0)
    x=40;
    if(x>40)
    x=0;
    if(y<0)
    y=40;
    if(y>40)
    y=0;
    
    if(key!=0)
    {
    if(food==0)
    {
      kill.removeRow(0);
      size--;
    }
    else
    {
      food--;
    }
    }
   if(x==foodx&&y==foody)
    {
      food++;
    do
    {
      foodx=(int)random(0,40);
      foody=(int)random(0,40);
      v=check(size, foodx, foody);
       }while(v==true);
    }
    }
} 
boolean check(int size, int x, int y){
  boolean check=false;
  for(int j=0; j<size; j++)
  {
    if(kill.getInt(j,"x")==x&&kill.getInt(j,"y")==y)
    check=true;
  } 
  return check;
}
