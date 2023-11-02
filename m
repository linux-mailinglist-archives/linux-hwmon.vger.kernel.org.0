Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FEF7DF47C
	for <lists+linux-hwmon@lfdr.de>; Thu,  2 Nov 2023 15:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjKBODD (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 2 Nov 2023 10:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjKBODD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2023 10:03:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EF1131
        for <linux-hwmon@vger.kernel.org>; Thu,  2 Nov 2023 07:03:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so745270a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Nov 2023 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698933780; x=1699538580; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNLytVSJlr1D0ot2ygWKsJu12BdCJtoL17C9W5FT6eY=;
        b=bbgxwEGJcLOkeiYbT9t1BTF1KrclA+NNX0Pg+Fdst0RciY5fjmta7yHLLeyBoo4+J0
         T1ZAT067sOEo3j+59a1X4y5JODhw8lNUo/lqnMTih49Om/+3tYE+n8E8Z2f1DkLkpkTZ
         2ISHQURYLLHgHVgwq+yAEOaLz9gvLmPwpEPA+DLsK8pc6bqkhjJO6aYr4PGo+0xl1Wak
         YReg8cprwuDO0+E0L5ZMykbO+IK1/ffnS1dDYKdtUYInYIfueu8KAJt9E7kGSKtFqkA4
         LqpZYEHytzb/Kwr/KoCVp/Z7piFUhLZtQUZqdLqPv/gOhTj+38rI7JVTCeOmeubJm/cW
         FVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933780; x=1699538580;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNLytVSJlr1D0ot2ygWKsJu12BdCJtoL17C9W5FT6eY=;
        b=iZJJ3qHspjgxDC0ZNrbVRtSlYWbGAkQ6GFum9dbMyNQTPF3lbzaMVExJ48OJV1w9RV
         gLMTSCGDy7ZwIBYlb+mXqKvkRESqgBLXkEne9g3fORCiuPApJRpTcbwC+OMY7LXJeofR
         z/uQQUaZGWJqNIvcaLaLhRXCRhQcQzSQHEa5Djq8TTn7FUx8p8II74cph0Lox7ScwLpu
         lQTFoVe12Be4x/eMTbNIkMU74xdIx+s6AE25lZzu0IbIdfInhILjvmw9BLBQrQfvxUc7
         uC4oHW7asDMhYRJ1N2rLdzRm0DMOb7kwHytUh8V2k1DkoGzJM3I6pt1mDPfv0WE256Mj
         qVyQ==
X-Gm-Message-State: AOJu0Yz3sZMrj9n+f3RAgrHAu7H7PmPFjVYFEuBDEb5IMa4NOGTJSngA
        Cq+s7npaas2M/T9IKZmhqx2e8+MzoFqYknGDziA=
X-Google-Smtp-Source: AGHT+IFyqIj4DlAYHu7aK8g7TR7OhRTNAAb8OSRH1M+hCdh4LSegzWkEsgpVhDyoizy8hddFbIpd9Cj9ZVe167HgOSQ=
X-Received: by 2002:a17:90a:2f47:b0:280:3f33:64d8 with SMTP id
 s65-20020a17090a2f4700b002803f3364d8mr12537554pjd.21.1698933780517; Thu, 02
 Nov 2023 07:03:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:792:b0:51a:59a:4014 with HTTP; Thu, 2 Nov 2023
 07:03:00 -0700 (PDT)
Reply-To: oj616414@gmail.com
From:   johnson pattaego <lenle.goungbiamam@gmail.com>
Date:   Thu, 2 Nov 2023 14:03:00 +0000
Message-ID: <CAL454wBsxwTtMn5RQPrxK5-mWqASgH3-b_TNOjE3+qeKFtBD+w@mail.gmail.com>
Subject: Re///
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

=C3=9Cdv=C3=B6zl=C3=B6m, van egy v=C3=A1llalkoz=C3=A1som, amelyre =C3=BAgy =
hivatkoztam r=C3=A1d, mint
neked   ugyanaz a vezet=C3=A9kn=C3=A9v, mint a n=C3=A9hai =C3=BCgyfelem, de=
 a r=C3=A9szletek az
al=C3=A1bbiak lesznek =C3=A9rtes=C3=ADtj=C3=BCk =C3=96nt, amikor meger=C5=
=91s=C3=ADti ennek az e-mailnek
a k=C3=A9zhezv=C3=A9tel=C3=A9t. =C3=9Cdv=C3=B6zlettel
