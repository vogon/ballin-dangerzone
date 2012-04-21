(
    var buffers = SoundFile.collectIntoBuffers(
        "/Users/rob/code/ballin-dangerzone/music/1_*.wav"
    );
    var clock = TempoClock.new(160.0 / 60);
    var prototype = {
        var b = buffers.choose;
        { PlayBuf.ar(2, b.bufnum, BufRateScale.kr(b.bufnum)) }.play;
        clock.sched(clock.beatsPerBar, prototype);
    };
    clock.playNextBar(prototype);
)
