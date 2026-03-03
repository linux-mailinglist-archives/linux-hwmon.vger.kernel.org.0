Return-Path: <linux-hwmon+bounces-12072-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM7oG9RTp2lsgwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12072-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 22:34:12 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 730811F7982
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 22:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 238FC305614A
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Mar 2026 21:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8376F48C8CC;
	Tue,  3 Mar 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SRa5SRVd"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944337B032;
	Tue,  3 Mar 2026 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573648; cv=none; b=slWrKYQtbgQWXZbermj2fx1Hh2rHtmbbNS1mwBoaAVsao3oJvwxrPKPAdJ+noDfEtSLW5yeQX3Ts/Hpplzr68B3kt+CDWZwmdnqKhOt1krwBkQW4LElSz8mI1+zw1elJyVIQZ6PQtC4gQ84Gov7IEIG6mJe7DfWWn6e+whDlPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573648; c=relaxed/simple;
	bh=HryfKVuHPWoa4guH+MKhMhNp3D1+IxUCSWAwTG05YYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oioO88O/fCvb2XJqL4+Brl1dtNjkEAfq9VPSYIZJqWbipMCqU7DdHMKw3kQP9GiRnRIb45DuAqaYkhSNJQXqNOi9Bg75vtBvDD48TU80Zcpk1iiQ3tAQElxfJj/GVL5Ap8ql+UCv12mVJBOVX7hxb7WBMgwQslH8GGBil919FZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SRa5SRVd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772573644;
	bh=HryfKVuHPWoa4guH+MKhMhNp3D1+IxUCSWAwTG05YYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRa5SRVdkTgUo+VWP3wZvStSUdf23EjL6iTA+ULFxYhkjvFTTjum0h+Ywv+yvJ9tV
	 77uDwPKxZ1Kur9z7X1t0kKLvF+7l/OUtlhorX7DdZLplP3ZyN9mlfIIuFIVY8/bm1R
	 WrEiuj2gQ6u9hEQbke8HzDXNpyK4mE8B40KmIQIc=
Date: Tue, 3 Mar 2026 22:34:04 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aureo Serrano <aureo.serrano@arctic.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <02626fba-6b7a-429d-9719-46862f175b4d@t-8ch.de>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
 <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
 <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>
 <d1d27763-c49d-4d02-9157-ec798bd10604@t-8ch.de>
 <72010133-5acc-43ac-8372-d0d830291ef0@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72010133-5acc-43ac-8372-d0d830291ef0@roeck-us.net>
X-Rspamd-Queue-Id: 730811F7982
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12072-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-03 12:42:13-0800, Guenter Roeck wrote:
> On 3/3/26 11:30, Thomas Weißschuh wrote:
> > On 2026-03-03 11:00:25-0800, Guenter Roeck wrote:
(...)

> > > > > +     } else {
> > > > > +           spin_unlock_irqrestore(&priv->lock, flags);
> > > > 
> > > > You can use the new guard() syntax from cleanup.h to avoid manual
> > > > unlocks on error paths.
> > > > 
> > > 
> > > Why would this code need interrupt disabled spinlocks in the first place ?
> > 
> > I *suspect* that it tries to be compatible with some semaphores in the
> > HID core.
> > 
> > > It reads individual entries from priv, but even if those are updated
> > > in parallel I don't see why that would warrant disabling interrupts,
> > > both here and in arctic_fan_parse_report().
> > > 
> > > The hwmon core already serializes read and write operations, so
> > > the locks (much less interrupt disabling spinlocks) are not needed
> > > for that either.
> > 
> > The HID callbacks can be fired at any time from the HID core,
> > concurrently to hwmon core logic. But I also dislike the spinlocks.
> > Maybe a mutex works, too?
> > 
> 
> Ah yes, I can see that arctic_fan_parse_report() reads all pwm values and
> arctic_fan_write() writes them to the controller. That does not explain
> why it would be necessary to disable interrupts, though, and even doing
> that is still not safe.
> 
> Example: arctic_fan_write() updates the pwm value for channel 1,
> writes the new value into priv->pwm_duty[1], and creates an output
> buffer with pwm values for all channels. After preparing the message,
> it releases the spinlock. The raw event handler receives and handles
> updated pwm values which are completely different. Then the old,
> now obsolete, values are sent to the controller (and, worse, the
> new cached value in priv->pwm_duty[1] would no longer match the value
> that was just sent to the controller).
> 
> That can never be made safe if the controller updates pwm values
> autonomously, no matter if spinlocks are involved or not. That would only
> work if fan control is manual, and in that case it would not be necessary
> to re-read pwm values from each raw event. The current code isn't safe
> even if fan control is manual, since reports from the controller will
> overwrite cached values and requests to change a value can overlap with
> reports returning the old value.
> 
> In this context ...
> 
> Other drivers also use complete() from raw events and wait_for_completion()
> variants after writing a command, so the code sequence in arctic_fan_send_report()
> will require closer scrutiny. It is not obvious to me why the loop and the
> msleep() calls would be needed for this driver but not for others.

Ack.

> > (...)
> > 
> > > > > +static int arctic_fan_probe(struct hid_device *hdev,
> > > > > +                     const struct hid_device_id *id)
> > > > > +{
> > > > > +     struct arctic_fan_data *priv;
> > > > > +     struct device *hwmon_dev;
> > > > > +     int ret;
> > > > > +
> > > > > +     ret = hid_parse(hdev);
> > > > > +     if (ret)
> > > > > +           return ret;
> > > > > +
> > > > > +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > > +     if (!priv)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
> > > > > +     if (!priv->out_buf)
> > > > > +           return -ENOMEM;
> > > > 
> > > > The 32 byte buffer could be on the stack, saving this allocation and
> > > > avoiding a shared resource.
> > > 
> > > It might need to be cache aligned, but even then it could be part of
> > > struct arctic_fan_data.
> > 
> > What would be the advantage of that over an on-stack placement?
> > 
> 
> Sorry, I should have said "cache line aligned", not just "cache aligned".
> Data on the stack won't be cache line aligned. I don't know if that is needed
> here, but some USB transactions require it (which is why USB drivers often
> allocate buffers separately).

We can use __aligned() for stack variables I think.
But with a quick search I didn't find any alignment requirements from
the HID subsystem. So IMO it shouldn't matter much for now.


Thomas

