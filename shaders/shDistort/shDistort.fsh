//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

float random(vec2 _st) {
	return fract(sin(dot(_st, vec2(8.1223, 12.876)))*53212.231);
}

void main()
{
	float noise = random(v_vTexcoord + u_time/10000.);
	noise = step(.1, noise);
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord)*vec4(.5, 0.2, 0.2, .4);
	//gl_FragColor *= vec4(noise, noise, noise, 1.);
}
