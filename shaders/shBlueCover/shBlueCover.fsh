//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	tex.rgb = vec3(0., 0., .8);
    gl_FragColor = v_vColour * tex;
}
