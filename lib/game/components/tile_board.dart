import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibeauty/application/game/game_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/game/models/board.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../const/colors.dart';

import 'animated_tile.dart';
import 'button.dart';

class TileBoardWidget extends StatelessWidget {
  final CustomColorSet colors;

  const TileBoardWidget(
      {super.key,
      required this.moveAnimation,
      required this.scaleAnimation,
      required this.colors});

  final CurvedAnimation moveAnimation;
  final CurvedAnimation scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final board = state.board ?? Board(0, 0, []);
        final size = max(
            290.0,
            min(
                (MediaQuery.of(context).size.shortestSide * 0.90)
                    .floorToDouble(),
                460.0));

        final sizePerTile = (size / 4).floorToDouble();
        final tileSize = sizePerTile - 12.0 - (12.0 / 4);
        final boardSize = sizePerTile * 4;
        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              ...List.generate(board.tiles.length, (i) {
                var tile = board.tiles[i];

                return AnimatedTile(
                  key: ValueKey(tile.id),
                  tile: tile,
                  moveAnimation: moveAnimation,
                  scaleAnimation: scaleAnimation,
                  size: tileSize,
                  child: Container(
                    width: tileSize,
                    height: tileSize,
                    decoration: BoxDecoration(
                        color: tileColors[tile.value],
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Center(
                        child: Text(
                      '${tile.value}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: tile.value < 8 ? textColor : textColorWhite),
                    )),
                  ),
                );
              }),
              if (board.over)
                Positioned.fill(
                    child: Container(
                  color: overlayColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        board.won ? AppHelper.getTrn(TrKeys.youWin) : AppHelper.getTrn(TrKeys.gameOver),
                        style: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 64.0),
                      ),
                      ButtonWidget(
                        colors: colors,
                        text: board.won ? AppHelper.getTrn(TrKeys.newGame) : AppHelper.getTrn(TrKeys.tryAgain),
                        onPressed: () {
                          context
                              .read<GameBloc>()
                              .add(const GameEvent.newGame());
                        },
                      )
                    ],
                  ),
                ))
            ],
          ),
        );
      },
    );
  }
}
