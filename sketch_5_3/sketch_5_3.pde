int lengte = 180;
int weight = 50;
String text = "Height is 180cm and weight is 50kg, so your BMI (roughly) is: ";

float cm_m = lengte / 100.0;



print(text);
println(Math.round(weight / (cm_m * cm_m)));
