//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
	vec2 uv = v_vTexcoord;
    gl_FragColor = texture2D( gm_BaseTexture, uv );
	gl_FragColor.rgb = 0.5 + 0.5*cos(u_time/1000. + uv.xyx + vec3(0.,2.,4.));
}
