import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onTap;
  final Color iconColor;
  final Color borderColor;

  AuthButton({
    required this.iconData,
    required this.title,
    required this.onTap,
    required this.iconColor,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 350,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white, // Cor de fundo padrão
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor, // Definindo a cor da borda (pode ser personalizada)
            width: 0.3, // Largura da borda
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: iconColor, // Cor do ícone definida
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF0C1622),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0.10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}