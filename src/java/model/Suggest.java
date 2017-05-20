///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package model;
//
///**
// *
// * @author Ahmed_Eldeeb
// */
//public class Suggest {
//    
//    
//    public static boolean searchsuggest(int to, int from) {
//
//        try {
//            
//            pre = con.prepareStatement("select * from suggest");
//            res = pre.executeQuery();
//            while (res.next()) {
//                int t = res.getInt(1);
//                int c = res.getInt(2);
//
//                if (to == t && from == c) {
//
//                    return true;
//                }
//
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex+"in method search");
//        }
//        return false;
//
//    }
//
//    public static void updatesuggest(int to, int from) {
//
//        if (searchsuggest(to, from)) {
//
//             try {
//                pre = con.prepareStatement("update suggest set Visit = Visit+1 where mn =? and fromto =?");
//                pre.setInt(1, to);
//                 pre.setInt(2, from);
//                pre.execute();
//
//            } catch (Exception ex) {
//                JOptionPane.showMessageDialog(null, ex+"\n in method update to update visit");
//            }
//            
//            //increment visit
//        } else {
//            try {
//                pre = con.prepareStatement("insert into suggest (mn,fromto) values (?,?)");
//
//                pre.setInt(1, to);
//
//                pre.setInt(2, from);
//
//                pre.execute();
//
//            } catch (Exception ex) {
//                JOptionPane.showMessageDialog(null, ex+"\n in method update to insert");
//            }
//            //add to from
//        }
//
//    }
//
//    public HashMap<Integer, Integer> suggestpost(int to) {
//
//        HashMap<Integer, Integer> su = new HashMap<>();
//
//        try {
//            System.out.println(to);
//            pre = con.prepareStatement("select Fromto,Visit from suggest where mn ="+to);
//            res = pre.executeQuery();
//
//            while (res.next()) {
//                int t = res.getInt(1);
//                int c = res.getInt(2);
//                System.out.println("t   =   "+t+"   c   =   "+c);
//                su.put(t, c);
//
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex);
//        }
//        return su;
//
//    }
//
//    public ArrayList<Integer> sort(HashMap<Integer, Integer> postsvisit) {
//
//        Object[] z = postsvisit.values().toArray();
//        java.util.Arrays.sort(z);
//        ArrayList<Integer> fin = new ArrayList<>();
//
//        try {
//
//            for (int i = z.length - 1; i >= 0; --i) {
//                for (Map.Entry<Integer, Integer> e : postsvisit.entrySet()) {
//
//                    if (e.getValue().equals(z[i]) && !z[i].equals(0)) {
//                        if (!fin.contains(e.getKey())) {
//                            fin.add(e.getKey());
//                        }
//                    }
//
//                }
//
//            }
//            System.out.println(fin);
//
//        } catch (Exception ex) {
//            Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return fin;
//    }
//    
//}
