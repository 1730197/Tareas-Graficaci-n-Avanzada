import java.util.*;
Circulo c1,c2,c3,tmp;
List <Circulo>lista;

int k=30;
int w=0;
float x,y;
String q="";
int n=-1;//para el id del circulo


void setup(){
  size(400,300);
  lista = new <Circulo>ArrayList();
  tmp=null;
  for(int i=0; i<k; i++){
    x=random(width);
    y=random(height);
    tmp = new Circulo(x,y,50,w);
    w++;
    lista.add(tmp);
  }
  /*c1= new Circulo(width/2,height/2,50,1);
  c2= new Circulo(width/4,height/2,50,1);
  c3= new Circulo(width/2,height/4,50,1);
  lista.add(c1);
  lista.add(c2);
  lista.add(c3);*/
}


void draw(){
  background(0);
  for(int i=0; i<lista.size(); i++){
    tmp= lista.get(i);
    tmp.dibuja();
  }
  textSize(24);
  fill(#DB145D);
  text(q,40,50);
  if(n!=-1)
    text(n,140,30);
  fill(255);

}

void mousePressed(){
  q="";
for(int i=lista.size()-1; i>0; i--){
      tmp = lista.get(i);
      if(tmp.isAdentro(mouseX, mouseY)){
        n=tmp.id;
        q += tmp.id;
        
        x = mouseX-tmp.x; 
        y = mouseY-tmp.y;
        break;
      }
  }
}

void mouseReleased(){
    q="";
    n=-1;//no se esta seleccionando ningun circulo.
    tmp = null;
}

void mouseDragged(){
    q="";

      tmp = lista.get(n);
      if(tmp.isAdentro(mouseX, mouseY)){
        n=tmp.id;
        q += tmp.id;
        tmp.x = mouseX-x; 
        tmp.y = mouseY-y;
        
      }


}
