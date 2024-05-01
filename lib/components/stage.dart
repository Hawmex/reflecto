import 'dart:math';

import 'package:navand/navand.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../extensions/date_time_string.dart';
import '../models/message.dart';
import '../models/stage_snapshot.dart';
import '../stores/interaction_status_store.dart';
import '../stores/weather_report_store.dart';
import '../widgets/stage_sequencer.dart';

final class Stage extends StatelessWidget {
  const Stage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<InteractionStatusStore>(
      (final context, final store) {
        return switch (store.status) {
          InteractionStatus.none => StageSequencer([
              StageSnapshot.message(const [
                Message('بیدارم کن!', icon: 'mode_standby'),
              ]),
            ]),
          InteractionStatus.sayHelloWithoutIntroQuestion => StageSequencer([
              StageSnapshot.message([
                Message(
                  'سلام! ${weatherReportStore.weatherReport == null ? 'وقت' : weatherReportStore.weatherReport!.isDay ? 'روز' : 'عصر'} بخیر.',
                  icon: 'waving_hand',
                ),
                Message(
                  'سلام! روز ${Jalali.now().weekDayName}‌ات بخیر.',
                  icon: 'chat',
                ),
              ]),
              StageSnapshot.message(const [
                Message(
                  'چه کاری می‌تونم برات انجام بدم؟',
                  icon: 'question_mark',
                )
              ]),
              if (Random().nextDouble() >= 0.5)
                StageSnapshot.message(const [
                  Message(
                    'راستی یه ویدیوی جذاب هم درمورد آخرین پیشرفت‌های فناوری دارم. اگه بخوای می‌تونیم با هم ببینیم.',
                    icon: 'chat',
                  ),
                ])
              else
                StageSnapshot.message(const [
                  Message(
                    'اگر خسته‌ای می‌تونیم با هم به یه قطعه موسیقی گوش بدیم.',
                    icon: 'chat',
                  ),
                ]),
            ]),
          InteractionStatus.sayHelloWithIntroQuestion => StageSequencer([
              StageSnapshot.message([
                Message(
                  'سلام! ${weatherReportStore.weatherReport == null ? 'وقت' : weatherReportStore.weatherReport!.isDay ? 'روز' : 'عصر'} بخیر.',
                  icon: 'waving_hand',
                ),
                Message(
                  'سلام! روز ${Jalali.now().formatter.wN}‌ات بخیر.',
                  icon: 'chat',
                ),
              ]),
              StageSnapshot.message(const [
                Message(
                  'می‌خوای خودمو بهت معرفی کنم؟',
                  icon: 'question_mark',
                )
              ]),
            ]),
          InteractionStatus.sayShortIntro => StageSequencer([
              StageSnapshot.message(const [
                Message(
                  'اسم من آینه‌ی هوشمنده. میخوای بیشتر درمورد من بدونی؟',
                  icon: 'question_mark',
                )
              ]),
            ]),
          InteractionStatus.sayReadyForCommands => StageSequencer([
              StageSnapshot.message(const [
                Message(
                  'چه کاری می‌تونم برات انجام بدم؟',
                  icon: 'question_mark',
                )
              ]),
              if (Random().nextDouble() >= 0.5)
                StageSnapshot.message(const [
                  Message(
                    'راستی یه ویدیوی جذاب هم درمورد آخرین پیشرفت‌های فناوری دارم. اگه بخوای می‌تونیم با هم ببینیم.',
                    icon: 'chat',
                  ),
                ])
              else
                StageSnapshot.message(const [
                  Message(
                    'اگر خسته‌ای می‌تونیم با هم به یه قطعه موسیقی گوش بدیم.',
                    icon: 'chat',
                  ),
                ]),
            ]),
          InteractionStatus.showFullIntroVideo => StageSequencer([
              StageSnapshot.video('./assets/videos/mirror_intro.mp4'),
              StageSnapshot.message(const [
                Message(
                  'می‌خوای درمورد ایرانداک بیشتر بدونی؟',
                  icon: 'question_mark',
                )
              ]),
            ]),
          InteractionStatus.showIrandocIntroVideo => StageSequencer([
              StageSnapshot.video('./assets/videos/irandoc_intro.mp4'),
              StageSnapshot.message(const [
                Message(
                  'چه کاری می‌تونم برات انجام بدم؟',
                  icon: 'question_mark',
                )
              ]),
              if (Random().nextDouble() >= 0.5)
                StageSnapshot.message(const [
                  Message(
                    'راستی یه ویدیوی جذاب هم درمورد آخرین پیشرفت‌های فناوری دارم. اگه بخوای می‌تونیم با هم ببینیم.',
                    icon: 'chat',
                  ),
                ])
              else
                StageSnapshot.message(const [
                  Message(
                    'اگر خسته‌ای می‌تونیم با هم به یه قطعه موسیقی گوش بدیم.',
                    icon: 'chat',
                  ),
                ]),
            ]),
          InteractionStatus.sayGoodbye => StageSequencer([
              StageSnapshot.message(const [
                Message(
                  'روز خوبی داشته باشی.',
                  icon: 'waving_hand',
                ),
                Message(
                  'به امید دیدار.',
                  icon: 'waving_hand',
                )
              ]),
              StageSnapshot.message(const [
                Message('بیدارم کن!', icon: 'mode_standby'),
              ]),
            ]),
          InteractionStatus.showVideo => StageSequencer([
              StageSnapshot.video('./assets/videos/${Random().nextInt(1)}.mp4'),
              StageSnapshot.message(const [
                Message(
                  'چه کاری می‌تونم برات انجام بدم؟',
                  icon: 'question_mark',
                ),
              ]),
              if (Random().nextDouble() >= 0.5)
                StageSnapshot.message(const [
                  Message(
                    'اگر خسته‌ای می‌تونیم با هم به یه قطعه موسیقی گوش بدیم.',
                    icon: 'chat',
                  ),
                ]),
            ]),
          InteractionStatus.playMusic => StageSequencer([
              StageSnapshot.audio('./assets/music/${Random().nextInt(1)}.mp3'),
              StageSnapshot.message(const [
                Message(
                  'چه کاری می‌تونم برات انجام بدم؟',
                  icon: 'question_mark',
                ),
              ]),
              if (Random().nextDouble() >= 0.5)
                StageSnapshot.message(const [
                  Message(
                    'راستی یه ویدیوی جذاب هم درمورد آخرین پیشرفت‌های فناوری دارم. اگه بخوای می‌تونیم با هم ببینیم.',
                    icon: 'chat',
                  ),
                ])
            ]),
          InteractionStatus.showVisual =>
            StageSequencer([StageSnapshot.powerbi()])
        };
      },
    );
  }
}
