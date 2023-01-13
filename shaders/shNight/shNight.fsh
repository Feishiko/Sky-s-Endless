//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
	vec3 col = smoothstep(0., 0.25*abs(sin(u_time)), vec3(0.1, 0.1, 0.2));
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgb *= col;
}
