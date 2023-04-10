shader_set(shRainbow);
shader_set_uniform_f(uTime, current_time);
draw_self();
shader_reset();