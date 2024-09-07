<?xml version='1.0'?>

<!DOCTYPE Detalle[
    <!ELEMENT Detalle (Evaluacion, Comentarios, Bibliografias, Recomendaciones, EstudianteDestacados)>
    <!ELEMENT Evaluacion (#PCDATA)>
    <!ELEMENT Comentarios (Comentario?)>
    <!ELEMENT Comentario (#PCDATA)>
    <!ELEMENT Bibliografias (Bibliografia+)>
    <!ELEMENT Bibliografia EMPTY>
    <!ELEMENT Recomendaciones (Recomendacion+)>
    <!ELEMENT Recomendacion (#PCDATA)>
    <!ELEMENT EstudianteDestacados (estudianteDestacado?)>
    <!ELEMENT estudianteDestacado EMPTY>
    
    <!ATTLIST Bibliografia titulo CDATA #REQUIRED> 
    <!ATTLIST Bibliografia direccion CDATA #REQUIRED>
    <!ATTLIST Bibliografia tipo (Video|Texto|Audio) CDATA #REQUIRED>   
    
    <!ATTLIST estudianteDestacado nombre CDATA #REQUIRED> 
    <!ATTLIST estudianteDestacado documento CDATA #REQUIRED> 
    <!ATTLIST estudianteDestacado motivo CDATA #REQUIRED> 

]>
