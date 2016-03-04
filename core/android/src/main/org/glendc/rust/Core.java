package org.glendc.rust

import android.app.Activity;

class Core {
    public static String Greeting(String name) {
        return String.format("Hello, %s!", name);
    }

    public static int Multiply(int a, int b) {
        return a * b;
    }
}
