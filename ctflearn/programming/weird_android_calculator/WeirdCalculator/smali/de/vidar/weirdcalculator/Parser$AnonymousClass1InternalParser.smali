.class Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/vidar/weirdcalculator/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AnonymousClass1InternalParser"
.end annotation


# instance fields
.field f0c:I

.field pos:I

.field final val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, -0x1

    iput v0, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->pos:I

    .line 13
    iput-object p1, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->val$str:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method eatChar()V
    .locals 3

    .prologue
    .line 17
    iget v1, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->pos:I

    add-int/lit8 v0, v1, 0x1

    .line 18
    .local v0, "i":I
    iput v0, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->pos:I

    .line 19
    iget-object v1, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->val$str:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->val$str:Ljava/lang/String;

    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    :goto_0
    iput v1, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    .line 20
    return-void

    .line 19
    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method eatSpace()V
    .locals 1

    .prologue
    .line 23
    :goto_0
    iget v0, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method parse()D
    .locals 5

    .prologue
    .line 29
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 30
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseExpression()D

    move-result-wide v0

    .line 31
    .local v0, "v":D
    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 32
    return-wide v0

    .line 34
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method parseExpression()D
    .locals 8

    .prologue
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    .line 38
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseTerm()D

    move-result-wide v2

    .line 40
    .local v2, "v":D
    :goto_0
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatSpace()V

    .line 41
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x2b

    if-eq v4, v5, :cond_1

    .line 42
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x2d

    if-eq v4, v5, :cond_0

    .line 52
    cmpl-double v4, v2, v6

    if-lez v4, :cond_2

    .line 53
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "The number is too large. Please buy the full version!"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 45
    :cond_0
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 46
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseTerm()D

    move-result-wide v4

    sub-double/2addr v2, v4

    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 49
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseTerm()D

    move-result-wide v4

    add-double/2addr v2, v4

    goto :goto_0

    .line 55
    :cond_2
    cmpl-double v4, v2, v6

    if-lez v4, :cond_3

    .line 56
    const/16 v4, 0x29

    new-array v0, v4, [I

    fill-array-data v0, :array_0

    .line 57
    .local v0, "flarry":[I
    array-length v5, v0

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v5, :cond_3

    aget v1, v0, v4

    .line 58
    .local v1, "i":I
    const-string v6, "OUTPUT"

    xor-int/lit16 v7, v1, 0x539

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 61
    .end local v0    # "flarry":[I
    .end local v1    # "i":I
    :cond_3
    return-wide v2

    .line 56
    nop

    :array_0
    .array-data 4
        0x57f
        0x575
        0x578
        0x57e
        0x542
        0x578
        0x569
        0x572
        0x566
        0x50d
        0x557
        0x558
        0x555
        0x540
        0x54a
        0x508
        0x54a
        0x566
        0x508
        0x54a
        0x566
        0x54b
        0x50d
        0x54d
        0x551
        0x50a
        0x54b
        0x566
        0x50a
        0x558
        0x54a
        0x540
        0x566
        0x508
        0x54a
        0x557
        0x54d
        0x566
        0x508
        0x54d
        0x544
    .end array-data
.end method

.method parseFactor()D
    .locals 7

    .prologue
    const/16 v6, 0x2d

    .line 84
    const/4 v0, 0x0

    .line 85
    .local v0, "negate":Z
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatSpace()V

    .line 86
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x28

    if-ne v4, v5, :cond_3

    .line 87
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 88
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseExpression()D

    move-result-wide v2

    .line 89
    .local v2, "v":D
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x29

    if-ne v4, v5, :cond_0

    .line 90
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 111
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatSpace()V

    .line 112
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x5e

    if-ne v4, v5, :cond_1

    .line 113
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 114
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseFactor()D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    .line 116
    :cond_1
    if-eqz v0, :cond_2

    .line 117
    neg-double v2, v2

    .line 119
    .end local v2    # "v":D
    :cond_2
    return-wide v2

    .line 93
    :cond_3
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x2b

    if-eq v4, v5, :cond_4

    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    if-ne v4, v6, :cond_5

    .line 94
    :cond_4
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    if-ne v4, v6, :cond_7

    const/4 v0, 0x1

    .line 95
    :goto_1
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 96
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatSpace()V

    .line 98
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v1, "sb":Ljava/lang/StringBuilder;
    :goto_2
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x30

    if-lt v4, v5, :cond_6

    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x39

    if-le v4, v5, :cond_8

    :cond_6
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v5, 0x2e

    if-eq v4, v5, :cond_8

    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-nez v4, :cond_9

    .line 107
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 94
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_7
    const/4 v0, 0x0

    goto :goto_1

    .line 103
    .restart local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_8
    iget v4, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    goto :goto_2

    .line 109
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .restart local v2    # "v":D
    goto :goto_0
.end method

.method parseTerm()D
    .locals 5

    .prologue
    const/16 v4, 0x2a

    .line 65
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseFactor()D

    move-result-wide v0

    .line 67
    .local v0, "v":D
    :goto_0
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatSpace()V

    .line 68
    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_0

    .line 69
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 70
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseFactor()D

    move-result-wide v2

    div-double/2addr v0, v2

    goto :goto_0

    .line 71
    :cond_0
    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    if-eq v2, v4, :cond_1

    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    const/16 v3, 0x28

    if-eq v2, v3, :cond_1

    .line 72
    return-wide v0

    .line 74
    :cond_1
    iget v2, p0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->f0c:I

    if-ne v2, v4, :cond_2

    .line 75
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->eatChar()V

    .line 77
    :cond_2
    invoke-virtual {p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parseFactor()D

    move-result-wide v2

    mul-double/2addr v0, v2

    goto :goto_0
.end method
