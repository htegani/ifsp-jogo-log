if (festa) {
    t += 0.2;
    y = base_y - abs(sin(t)) * 24;   // pula até 24 pixels
} else {
    y = base_y;
}