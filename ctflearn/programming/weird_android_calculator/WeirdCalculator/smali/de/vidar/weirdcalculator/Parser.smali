.class public Lde/vidar/weirdcalculator/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static eval(Ljava/lang/String;)D
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 124
    new-instance v0, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;

    invoke-direct {v0, p0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lde/vidar/weirdcalculator/Parser$AnonymousClass1InternalParser;->parse()D

    move-result-wide v0

    return-wide v0
.end method
