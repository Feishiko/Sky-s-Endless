//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	tex.rgb -= 0.4*vec3(tex.r + tex.g + tex.b)/3.;
    gl_FragColor = v_vColour * tex;
}
