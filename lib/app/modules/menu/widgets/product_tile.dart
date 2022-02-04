import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/vakinha_ui.dart';

class ProductTile extends StatelessWidget {
  
  const ProductTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                        image: NetworkImage('https://s2.glbimg.com/w-RIgGFLB5I_mxAwM5G6exgRktE=/0x0:1080x608/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2021/5/K/EPOEiySp2bPFu4ciALlQ/capas-para-materias-gshow-home.jpg'),
                        fit: BoxFit.cover
                      ),
             )
             ),
             Expanded(
               child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            // Alinhar da esqueda para a direita
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            Text(
                              'X-Tudão',
                              style: VakinhaUI.textBold
                            ),
                            Text(
                              r'R$ 200,00',
                            ),
                          ],),
                      )
             )
          ],
        ),
      ),
    );
  }
}