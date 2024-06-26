// Sources flattened with hardhat v2.22.5 https://hardhat.org

// File contracts/NFTSTORE.sol

∩┐╜∩┐╜/ /   S P D X - L i c e n s e - I d e n t i f i e r :   M I T 
 
 p r a g m a   s o l i d i t y   ^ 0 . 8 . 0 ; 
 
 
 
 i m p o r t   " @ o p e n z e p p e l i n / c o n t r a c t s / t o k e n / E R C 7 2 1 / E R C 7 2 1 . s o l " ; 
 
 i m p o r t   " @ o p e n z e p p e l i n / c o n t r a c t s / t o k e n / E R C 7 2 1 / e x t e n s i o n s / E R C 7 2 1 U R I S t o r a g e . s o l " ; 
 
 
 
 c o n t r a c t   N F T S T O R E   i s   E R C 7 2 1 U R I S t o r a g e   { 
 
         a d d r e s s   p a y a b l e   p u b l i c   m a r k e t p l a c e O w n e r ; 
 
         u i n t 2 5 6   p u b l i c   l i s t i n g F e e P e r c e n t   =   2 0 ; 
 
         u i n t 2 5 6   p r i v a t e   c u r r e n t T o k e n I d ; 
 
         u i n t 2 5 6   p r i v a t e   t o t a l I t e m s S o l d ; 
 
 
 
         s t r u c t   N F T L i s t i n g   { 
 
                 u i n t 2 5 6   t o k e n I d ; 
 
                 a d d r e s s   p a y a b l e   o w n e r ; 
 
                 a d d r e s s   p a y a b l e   s e l l e r ; 
 
                 u i n t 2 5 6   p r i c e ; 
 
                 b o o l   i s L i s t e d ; 
 
         } 
 
 
 
         m a p p i n g   ( u i n t 2 5 6   = >   N F T L i s t i n g )   p r i v a t e   t o k e n I d T o L i s t i n g ; 
 
 
 
         m o d i f i e r   o n l y O w n e r   { 
 
                 r e q u i r e ( m s g . s e n d e r   = =   m a r k e t p l a c e O w n e r ,   " O n l y   o w n e r   c a n   c a l l   t h i s   f u n c t i o n " ) ; 
 
                 _ ; 
 
         } 
 
 
 
         c o n s t r u c t o r ( )   E R C 7 2 1 ( " N F T S T O R E " ,   " N F T S " )   { 
 
                 m a r k e t p l a c e O w n e r   =   p a y a b l e ( m s g . s e n d e r ) ; 
 
         } 
 
 
 
         f u n c t i o n   u p d a t e L i s t i n g F e e P e r c e n t ( u i n t 2 5 6   _ l i s t i n g F e e P e r c e n t )   p u b l i c   o n l y O w n e r   { 
 
                 l i s t i n g F e e P e r c e n t   =   _ l i s t i n g F e e P e r c e n t ; 
 
         } 
 
 
 
         f u n c t i o n   g e t L i s t i n g F e e P e r c e n t ( )   p u b l i c   v i e w   r e t u r n s   ( u i n t 2 5 6 )   { 
 
                 r e t u r n   l i s t i n g F e e P e r c e n t ; 
 
         } 
 
 
 
         f u n c t i o n   g e t C u r r e n t T o k e n I d ( )   p u b l i c   v i e w   r e t u r n s ( u i n t 2 5 6 )   { 
 
                 r e t u r n   c u r r e n t T o k e n I d ; 
 
         } 
 
 
 
         f u n c t i o n   g e t N F T L i s t i n g ( u i n t 2 5 6   _ t o k e n I d )   p u b l i c   v i e w   r e t u r n s ( N F T L i s t i n g   m e m o r y )   { 
 
                 r e t u r n   t o k e n I d T o L i s t i n g [ _ t o k e n I d ] ; 
 
         } 
 
 
 
         f u n c t i o n   c r e a t e T o k e n ( s t r i n g   m e m o r y   _ t o k e n U R I ,   u i n t 2 5 6   _ p r i c e )   p u b l i c   r e t u r n s ( u i n t 2 5 6 )   { 
 
                 r e q u i r e ( _ p r i c e   >   0 ,   " P r i c e   m u s t   b e   g r e a t e r   t h a n   z e r o " ) ; 
 
 
 
                 c u r r e n t T o k e n I d + + ; 
 
                 u i n t 2 5 6   n e w T o k e n I d   =   c u r r e n t T o k e n I d ; 
 
                 _ s a f e M i n t ( m s g . s e n d e r ,   n e w T o k e n I d ) ; 
 
                 _ s e t T o k e n U R I ( n e w T o k e n I d ,   _ t o k e n U R I ) ; 
 
 
 
                 _ c r e a t e N F T L i s t i n g ( n e w T o k e n I d ,   _ p r i c e ) ; 
 
 
 
                 r e t u r n   n e w T o k e n I d ; 
 
         } 
 
 
 
         f u n c t i o n   _ c r e a t e N F T L i s t i n g ( u i n t 2 5 6   _ t o k e n I d ,   u i n t 2 5 6   _ p r i c e )   p r i v a t e   { 
 
                 t o k e n I d T o L i s t i n g [ _ t o k e n I d ]   =   N F T L i s t i n g ( { 
 
                         t o k e n I d :   _ t o k e n I d , 
 
                         o w n e r :   p a y a b l e ( m s g . s e n d e r ) , 
 
                         s e l l e r :   p a y a b l e ( m s g . s e n d e r ) , 
 
                         p r i c e :   _ p r i c e , 
 
                         i s L i s t e d :   t r u e 
 
                 } ) ; 
 
         } 
 
 
 
         f u n c t i o n   e x e c u t e S a l e ( u i n t 2 5 6   t o k e n I d )   p u b l i c   p a y a b l e   { 
 
                 N F T L i s t i n g   s t o r a g e   l i s t i n g   =   t o k e n I d T o L i s t i n g [ t o k e n I d ] ; 
 
                 u i n t 2 5 6   p r i c e   =   l i s t i n g . p r i c e ; 
 
                 a d d r e s s   p a y a b l e   s e l l e r   =   l i s t i n g . s e l l e r ; 
 
 
 
                 r e q u i r e ( m s g . v a l u e   = =   p r i c e ,   " P l e a s e   s u b m i t   t h e   a s k i n g   p r i c e   t o   c o m p l e t e   t h e   p u r c h a s e " ) ; 
 
 
 
                 l i s t i n g . s e l l e r   =   p a y a b l e ( m s g . s e n d e r ) ; 
 
                 l i s t i n g . i s L i s t e d   =   f a l s e ;   / /   M a r k   a s   n o t   l i s t e d   a f t e r   s a l e 
 
                 t o t a l I t e m s S o l d + + ; 
 
 
 
                 _ t r a n s f e r ( l i s t i n g . o w n e r ,   m s g . s e n d e r ,   t o k e n I d ) ; 
 
 
 
                 u i n t 2 5 6   l i s t i n g F e e   =   ( p r i c e   *   l i s t i n g F e e P e r c e n t )   /   1 0 0 ; 
 
                 m a r k e t p l a c e O w n e r . t r a n s f e r ( l i s t i n g F e e ) ; 
 
                 s e l l e r . t r a n s f e r ( m s g . v a l u e   -   l i s t i n g F e e ) ; 
 
         } 
 
 
 
         f u n c t i o n   g e t A l l L i s t e d N F T s ( )   p u b l i c   v i e w   r e t u r n s   ( N F T L i s t i n g [ ]   m e m o r y )   { 
 
                 u i n t 2 5 6   t o t a l N F T C o u n t   =   c u r r e n t T o k e n I d ; 
 
                 u i n t 2 5 6   l i s t e d C o u n t   =   0 ; 
 
                 u i n t 2 5 6   c u r r e n t I n d e x   =   0 ; 
 
 
 
                 f o r   ( u i n t 2 5 6   i   =   0 ;   i   <   t o t a l N F T C o u n t ;   i + + )   { 
 
                         i f   ( t o k e n I d T o L i s t i n g [ i   +   1 ] . i s L i s t e d )   { 
 
                                 l i s t e d C o u n t + + ; 
 
                         } 
 
                 } 
 
 
 
                 N F T L i s t i n g [ ]   m e m o r y   l i s t e d N F T s   =   n e w   N F T L i s t i n g [ ] ( l i s t e d C o u n t ) ; 
 
                 f o r   ( u i n t 2 5 6   i   =   0 ;   i   <   t o t a l N F T C o u n t ;   i + + )   { 
 
                         i f   ( t o k e n I d T o L i s t i n g [ i   +   1 ] . i s L i s t e d )   { 
 
                                 u i n t 2 5 6   t o k e n I d   =   i   +   1 ; 
 
                                 N F T L i s t i n g   s t o r a g e   l i s t i n g   =   t o k e n I d T o L i s t i n g [ t o k e n I d ] ; 
 
                                 l i s t e d N F T s [ c u r r e n t I n d e x ]   =   l i s t i n g ; 
 
                                 c u r r e n t I n d e x   + =   1 ; 
 
                         } 
 
                 } 
 
 
 
                 r e t u r n   l i s t e d N F T s ; 
 
         } 
 
 
 
         f u n c t i o n   g e t M y N F T s ( )   p u b l i c   v i e w   r e t u r n s ( N F T L i s t i n g [ ]   m e m o r y )   { 
 
                 u i n t 2 5 6   t o t a l N F T C o u n t   =   c u r r e n t T o k e n I d ; 
 
                 u i n t 2 5 6   m y N F T C o u n t   =   0 ; 
 
                 u i n t 2 5 6   c u r r e n t I n d e x   =   0 ; 
 
 
 
                 f o r   ( u i n t 2 5 6   i   =   0 ;   i   <   t o t a l N F T C o u n t ;   i + + )   { 
 
                         i f   ( t o k e n I d T o L i s t i n g [ i   +   1 ] . o w n e r   = =   m s g . s e n d e r   | |   t o k e n I d T o L i s t i n g [ i   +   1 ] . s e l l e r   = =   m s g . s e n d e r )   { 
 
                                 m y N F T C o u n t + + ; 
 
                         } 
 
                 } 
 
 
 
                 N F T L i s t i n g [ ]   m e m o r y   m y N F T s   =   n e w   N F T L i s t i n g [ ] ( m y N F T C o u n t ) ; 
 
                 f o r   ( u i n t 2 5 6   i   =   0 ;   i   <   t o t a l N F T C o u n t ;   i + + )   { 
 
                         i f   ( t o k e n I d T o L i s t i n g [ i   +   1 ] . o w n e r   = =   m s g . s e n d e r   | |   t o k e n I d T o L i s t i n g [ i   +   1 ] . s e l l e r   = =   m s g . s e n d e r )   { 
 
                                 u i n t 2 5 6   t o k e n I d   =   i   +   1 ; 
 
                                 N F T L i s t i n g   s t o r a g e   l i s t i n g   =   t o k e n I d T o L i s t i n g [ t o k e n I d ] ; 
 
                                 m y N F T s [ c u r r e n t I n d e x ]   =   l i s t i n g ; 
 
                                 c u r r e n t I n d e x + + ; 
 
                         } 
 
                 } 
 
 
 
                 r e t u r n   m y N F T s ; 
 
         } 
 
 } 
