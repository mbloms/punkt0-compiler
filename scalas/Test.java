public class Test {
    class Specific {
        public Object getMe() {
            return this;
        }
    }

    public Test() {
        Object o = new Specific().getMe();
        System.out.println(o.getClass().getName()); //Test$Specific
    }

    public static void main(String[] args) {
        new Test();
    }
}
